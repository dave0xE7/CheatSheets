


sudo apt-get update

Installing Apache2

    apt-get install apache2 libapache2-mod-php7.0


<?php phpinfo(); ?>


Installing PHP 7.0

    apt-get install php7.0 php7.0-mysql


Installing Mysql

    #apt-get install mysql-server mysql-client
    apt-get install mariadb-client mariadb-server

Creating a Mysql User and Database

    mysql -u root -p

    CREATE DATABASE newdb;
    CREATE USER 'username'@'localhost' IDENTIFIED BY 'userpassword';
    GRANT ALL PRIVILEGES ON newdb.* to 'username'@'localhost';
    FLUSH PRIVILEGES;
    quit


Installing Phpmyadmin for database management

    apt-get install phpmyadmin