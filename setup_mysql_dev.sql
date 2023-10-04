-- Creates a MySQL server with:
--   A database hbnb_dev_db,
--   A new user hbnb_dev with password hbnb_dev_pwd in localhost.
--   Grants all privileges for hbnb_dev on hbnb_dev_db.
--   Grants SELECT privilege for hbnb_dev on performance.

-- Connect to the MySQL server as root
db = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='your_root_password'
)

-- Creating a cursor object to execute the queries
cursor = db.cursor()

-- Creating the database if it doesn't exist
cursor.execute("CREATE DATABASE IF NOT EXISTS hbnb_dev_db")

-- Creating the user if it doesn't exist and set the password
cursor.execute("CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd'")

-- Granting all privileges on hbnb_dev_db to hbnb_dev
cursor.execute("GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost'")

-- Granting SELECT privilege on performance_schema to hbnb_dev
cursor.execute("GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost'")

-- Flushing privileges to apply the changes
cursor.execute("FLUSH PRIVILEGES")

-- Closing the cursor and database connection
cursor.close()
db.close()