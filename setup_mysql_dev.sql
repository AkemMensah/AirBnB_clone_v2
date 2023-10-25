-- Creating the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;

-- Creating the user if it doesn't exist and set the password
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd';

-- Granting all privileges on hbnb_dev_db to hbnb_dev
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';

-- Granting SELECT privilege on performance_schema to hbnb_dev
GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost';

-- Flushing privileges to apply the changes
FLUSH PRIVILEGES;

-- Closing the cursor and database connection
