
# E-Commerce Database Lab: PostgreSQL Relationships

In this lab, you will design and implement a PostgreSQL database for an e-commerce application. You will create four tables: `user`, `address`, `category`, and `product`. You will also implement **One-to-One** and **One-to-Many** relationships between the tables. Additionally, you will practice querying the database with different conditions.

## Requirements

### 1. **Create the Database Tables**

You are required to create four tables with the following specifications:

#### **User Table**
- `user_id`: Primary key (integer, auto-incremented)
- `username`: Unique, not null (string, 6-20 characters)
- `password`: Not null, must be above 6 characters (string)
- `email`: Unique, not null (string)
- `address_id`: Foreign key to the `address` table (integer)

#### **Address Table**
- `address_id`: Primary key (integer, auto-incremented)
- `street_address`: Not null (string)
- `zip_code`: Not null (string)
- `city`: Not null (string)
- `country`: Not null (string)

#### **Category Table**
- `category_id`: Primary key (integer, auto-incremented)
- `category_name`: Not null, unique (string)

#### **Product Table**
- `product_id`: Primary key (integer, auto-incremented)
- `product_name`: Not null (string)
- `price`: Not null (decimal)
- `quantity`: Not null (integer)
- `creator_id`: Foreign key to the `user` table (integer)
- `category_id`: Foreign key to the `category` table (integer)

---

### 2. **Relationships**
- **One-to-One**: A `User` can have one `Address`. Ensure that `address_id` in the `user` table is a foreign key referencing the `address` table.
- **One-to-Many**: A `User` can create many `Products`. Add a foreign key `creator_id` in the `product` table referencing `user_id`.
- **One-to-Many**: A `Category` can have many `Products`. Add a foreign key `category_id` in the `product` table referencing `category_id`.

---

### 3. **Sample Data**

Insert sample data into each table to test your relationships. Below are the commands to insert sample data:

```sql
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
```

---

### 4. **Queries**

Now that you have inserted some data, write SQL queries to retrieve information from your database. Because we havent learned Joins yet you can use the foreign key id in your WHERE clause:

1. **Query the products created by a user with `id = 1`.**
   - Return all products made by the user.

2. **Query all products in a specific category.**
   - Return all products in a category by id (e.g., 'Electronics').

3. **Query all products with stock lower than 50.**
   - Return products that have a quantity lower than 50.

4. **Query all products with a price greater than $100.**
   - Retrieve products that are priced above $100.

---

### 5. **Bonus: Additional Queries**

Write these bonus queries to test your understanding:

1. **Find the category with the highest number of products.**
   - Return the category with the most products listed in the database.

2. **Find users who do not have any products listed.**
   - Retrieve users who have not created any products.

