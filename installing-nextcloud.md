
sudo apt update
sudo apt install apache2 mariadb-server libapache2-mod-php7.4
sudo apt install php7.4-gd php7.4-mysql php7.4-curl php7.4-mbstring php7.4-intl
sudo apt install php7.4-gmp php7.4-bcmath php-imagick php7.4-xml php7.4-zip


sudo /etc/init.d/mysql start
sudo mysql -uroot -p

CREATE USER 'nextcloud'@'localhost' IDENTIFIED BY 'N3chsteCLouD';
CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost';
FLUSH PRIVILEGES;


wget https://download.nextcloud.com/server/releases/nextcloud-23.0.3.zip

## dir
    chown -R www-data:www-data /var/www/nextcloud/

## apache vhost config

    <VirtualHost *:80>
    DocumentRoot /var/www/nextcloud/
    ServerName  your.server.com

    <Directory /var/www/nextcloud/>
        Require all granted
        AllowOverride All
        Options FollowSymLinks MultiViews

        <IfModule mod_dav.c>
        Dav off
        </IfModule>
    </Directory>
    </VirtualHost>


## Additional Apache configurations

    For Nextcloud to work correctly, we need the module mod_rewrite. Enable it by running:

    a2enmod rewrite

    Additional recommended modules are mod_headers, mod_env, mod_dir and mod_mime:

    a2enmod headers
    a2enmod env
    a2enmod dir
    a2enmod mime

# config/config.php
## Pretty URLs

'overwrite.cli.url' => 'https://example.org/',
'htaccess.RewriteBase' => '/',

## Multiple domains reverse SSL proxy

If you want to access your Nextcloud installation http://domain.tld/nextcloud via a multiple domains reverse SSL proxy https://ssl-proxy.tld/domain.tld/nextcloud with the IP address 10.0.0.1 you can set the following parameters inside the config/config.php.

<?php
$CONFIG = array (
  'trusted_proxies'   => ['10.0.0.1'],
  'overwritehost'     => 'ssl-proxy.tld',
  'overwriteprotocol' => 'https',
  'overwritewebroot'  => '/domain.tld/nextcloud',
  'overwritecondaddr' => '^10\.0\.0\.1$',
);

