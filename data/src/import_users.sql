-- import_users.sql
-- This script imports data from users.csv into the users table

-- Assuming the users table already exists with the following schema:
-- CREATE TABLE users (
--     id VARCHAR(255) PRIMARY KEY,
--     first_name VARCHAR(255),
--     last_name VARCHAR(255),
--     city VARCHAR(255),
--     age INT,
--     password VARCHAR(255)
-- );

-- Load data from users.csv into the users table
COPY users (first_name, last_name, city, age, id, password)
FROM '/data/users.csv'
WITH (FORMAT csv, HEADER true);
