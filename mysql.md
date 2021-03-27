#using the mysql cli

mysql -u $user -p

mysql --user=finley --password=password db_name





SHOW VARIABLES LIKE "password_policy%";

SET GLOBAL validate_password.policy=LOW;

<<<<<<< HEAD
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'
=======

CREATE USER 'jeffrey'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new_password1';



>>>>>>> 85a591acaf7803df54d9707632cff6aeeac041ef
