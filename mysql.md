

SHOW VARIABLES LIKE "password_policy%";

SET GLOBAL validate_password.policy=LOW;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'
