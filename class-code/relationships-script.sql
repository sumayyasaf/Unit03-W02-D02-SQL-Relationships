-- ONE TO MANY

-- Movies Many
CREATE TABLE movies(
movie_id SERIAL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
release_year INT NOT NULL,
duration INT,
genre VARCHAR(255),
language VARCHAR(255),
rating DECIMAL(2,1),
-- foreign key
director_id REFERENCES directors(director_id)
);



-- Directors One
CREATE TABLE directors(
director_id SERIAL PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
birth_date DATE,
nationality VARCHAR(100),
won_oscars BOOLEAN
);


-- foreign key goes in the many side




SELECT * FROM movies;
SELECT * FROM directors;

TRUNCATE TABLE movies;



-- Inserting values
INSERT INTO directors(first_name,last_name, birth_date,nationality, won_oscars)
VALUES('Kai','Weluda','1996-11-01','German',True);

INSERT INTO movies(title,release_year,duration,genre,language,rating,director_id)
VALUES('Shawshank Redemption',2005,150,'Thriller','English',9.2,1);


CREATE TABLE users(
user_id SERIAL PRIMARY KEY,
username VARCHAR(255),
password VARCHAR(255)
);

CREATE TABLE user_details(
user_details_id SERIAL PRIMARY KEY,
email VARCHAR(255),
security_question VARCHAR(255),
security_answer VARCHAR(255),
hobbies VARCHAR(255),
age INT,
user_id INT REFERENCES users(user_id) UNIQUE
);


SELECT * FROM users;
SELECT * FROM user_details;

INSERT INTO users(username,password)
VALUES('hasan','password123');

INSERT INTO user_details(email,user_id)
VALUES('kai@gmail.com',1);

ALTER TABLE movies DROP COLUMN genre;


CREATE TABLE genres(
genre_id SERIAL PRIMARY KEY,
genre_name VARCHAR(255) NOT NULL
);


ALTER TABLE movies ADD COLUMN genre_id INT REFERENCES genres(genre_id);

