-- Creating Address Table
CREATE TABLE address (
                         address_id SERIAL PRIMARY KEY,
                         street_address VARCHAR(255) NOT NULL,
                         zip_code VARCHAR(20) NOT NULL,
                         city VARCHAR(100) NOT NULL,
                         country VARCHAR(100) NOT NULL
);

-- Creating User Table
CREATE TABLE "user" (
                        user_id SERIAL PRIMARY KEY,
                        username VARCHAR(20) UNIQUE NOT NULL CHECK (LENGTH(username) BETWEEN 6 AND 20),
                        password VARCHAR(255) NOT NULL CHECK (LENGTH(password) > 6),
                        email VARCHAR(255) UNIQUE NOT NULL,
                        address_id INTEGER UNIQUE,  -- One-to-One Relationship
                        FOREIGN KEY (address_id) REFERENCES address(address_id) ON DELETE SET NULL
);

-- Creating Category Table
CREATE TABLE category (
                          category_id SERIAL PRIMARY KEY,
                          category_name VARCHAR(100) UNIQUE NOT NULL
);

-- Creating Product Table
CREATE TABLE product (
                         product_id SERIAL PRIMARY KEY,
                         product_name VARCHAR(255) NOT NULL,
                         price DECIMAL(10,2) NOT NULL,
                         quantity INTEGER NOT NULL,
                         creator_id INTEGER,
                         category_id INTEGER,
                         FOREIGN KEY (creator_id) REFERENCES "user"(user_id) ON DELETE CASCADE,
                         FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);
-- Inserting sample addresses
INSERT INTO address (street_address, zip_code, city, country)
VALUES
    ('123 Elm St', '12345', 'New York', 'USA'),
    ('456 Oak St', '67890', 'Los Angeles', 'USA');

-- Inserting sample users
INSERT INTO "user" (username, password, email, address_id)
VALUES
    ('john_doe', 'password123', 'john@example.com', 1),
    ('jane_smith', 'securepass456', 'jane@example.com', 2);

-- Inserting sample categories
INSERT INTO category (category_name)
VALUES
    ('Electronics'),
    ('Fashion'),
    ('Home Appliances');

-- Inserting sample products
INSERT INTO product (product_name, price, quantity, creator_id, category_id)
VALUES
    ('Smartphone', 599.99, 100, 1, 1),
    ('Laptop', 799.99, 50, 1, 1),
    ('T-shirt', 19.99, 200, 2, 2),
    ('Washing Machine', 499.99, 30, 2, 3);
-->Query the products created by a user with id = 1
SELECT * FROM product WHERE product_id = '1';

-->Query all products with stock lower than 50
SELECT * FROM product WHERE quantity < 50;

-->Query all products with a price greater than $100
SELECT * FROM product WHERE price > 100;

--> Bonus: Additional Queries
SELECT category_id, COUNT(*) AS product_count FROM product GROUP BY category_id ORDER BY product_count DESC LIMIT 1;

-->Find users who do not have any products listed
SELECT * FROM "user" WHERE user_id NOT IN (SELECT DISTINCT creator_id FROM product);
