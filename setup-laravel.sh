apt update -y
apt install sudo curl git gnupg unzip -y
apt install php php-gd php-mbstring php-xml -y

apt install apache2 libapache2-mod-php -y


cd /tmp
wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
dpkg -i mysql-apt-config*
apt update -y

apt install mysql-server php-mysql mysql-client -y
apt install php-mysql -y

systemctl restart mysql
systemctl restart apache2 

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

# installing laravel

cd /var/www
git clone https://github.com/laravel/laravel.git

cd /var/www/laravel
sudo composer install

chown -R www-data.www-data /var/www/laravel
chmod -R 755 /var/www/laravel
chmod -R 777 /var/www/laravel/storage

mv .env.example .env
php artisan key:generate

echo "enter mysql root password"
read $mysqlrootpw

database=laravel
user=laravel
password=ehdespassword

mysql --user="root" --password="$mysqlrootpw" --execute="CREATE DATABASE laravel; CREATE USER 'laravel'@'localhost' IDENTIFIED BY 'ehdespassword'; GRANT ALL PRIVILEGES ON laravel.* TO 'laravel'@'localhost'; FLUSH PRIVILEGES;"

echo "<VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/laravel/public

        <Directory />
                Options FollowSymLinks
                AllowOverride None
        </Directory>
        <Directory /var/www/laravel>
                AllowOverride All
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>" >> /etc/apache2/sites-available/laravel.conf

a2enmod rewrite
a2dissite 000-default.conf
a2ensite laravel.conf

systemctl restart apache2
