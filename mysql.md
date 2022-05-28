# using the mysql commandline client

    mysql -u $user -p

    mysql --user=finley --password=password db_name

## changeing the password policy

    SHOW VARIABLES LIKE "password_policy%";

    SET GLOBAL validate_password.policy=LOW;

## creating a new user

    CREATE USER 'jeffrey'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new_password1';

## granting privileges

    GRANT ALL PRIVILEGES ON books.authors TO 'tolkien'@'localhost';

## initial setup for new db

    CREATE DATABASE newdb;
    CREATE USER 'username'@'localhost' IDENTIFIED BY 'userpassword';
    GRANT ALL PRIVILEGES ON newdb.* TO 'username'@'localhost';
    FLUSH PRIVILEGES;
