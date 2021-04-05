#using the mysql cli

mysql -u $user -p

mysql --user=finley --password=password db_name





SHOW VARIABLES LIKE "password_policy%";

SET GLOBAL validate_password.policy=LOW;


CREATE USER 'jeffrey'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new_password1';

GRANT ALL PRIVILEGES ON books.authors  TO 'tolkien'@'localhost';

