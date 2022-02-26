


sudo apt-get update

Installing Apache2

    apt-get install apache2 libapache2-mod-php7.0

Installing PHP 7.0

    apt-get install php7.0 php7.0-mysql

Check the Installation

    php -v

    echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

Installing PHP 7.2

    apt install apt-transport-https lsb-release ca-certificates
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
    apt update
    apt install php7.2 php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-mysql php7.2-zip php7.2-fpm php7.2-mbstring
    apt install libapache2-mod-php7.2

Disable PHP 7.0 and Enable PHP 7.2

    a2dismod php7.0
    systemctl restart apache2
    a2enmod php7.2
    systemctl restart apache2

Installing Mysql

    #apt-get install mysql-server mysql-client
    apt-get install mariadb-client mariadb-server

Creating a Mysql User and Database

    mysql -u root -p

    CREATE DATABASE newdb;
    CREATE USER 'username'@'localhost' IDENTIFIED BY 'userpassword';
    GRANT ALL PRIVILEGES ON newdb.* TO 'username'@'localhost';
    FLUSH PRIVILEGES;

    squit


Installing Phpmyadmin for database management

    apt-get install phpmyadmin


Install Full LAMP Stack

    apt-get update -y; apt-get install apache2 libapache2-mod-php7.0 php7.0 php7.0-mysql mariadb-client mariadb-server -y
    
    apt-get update -y; apt-get install apache2 libapache2-mod-php php php-mysql mariadb-client mariadb-server -y

Create New Database and User

    read -p "New Database: " dbname; read -p "New Username: " dbuser; read -p "New Password: " dbpass && echo "CREATE DATABASE $dbname; CREATE USER '$dbuser'@'localhost' IDENTIFIED BY 'userpassword'; GRANT ALL PRIVILEGES ON $dbname.* TO '$dbuser'@'localhost'; FLUSH PRIVILEGES;" | mysql

