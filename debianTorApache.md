
create webspace dir

    $ sudo mkdir -p /var/www/hidden_service/

change permissions

    $ sudo chown -R www-data:www-data /var/www/hidden_service/
    $ sudo chmod -R 755 /var/www



Now, we need to make a few changes to the Apache configuration. Let’s start by setting Apache up to only listen to port 80 on 127.0.1.1:

    sudo nano /etc/apache2/ports.conf

Change the line Listen 80 to Listen 127.0.0.1:80 and save the file.

Now we will access the security configuration file:

    sudo nano /etc/apache2/conf-enabled/security.conf

Change the line for ServerSignature to ServerSignature Off and the line for ServerTokens to ServerTokens Prod to restrict information the httpd reports about the server.

Then, we will make an edit to the main Apache configuration file to override the server name Apache uses:

    sudo nano /etc/apache2/apache2.conf

At the very bottom of the file, paste the following. Make sure that the ServerName field contains your onion address which you read from the hostname file earlier and not my address, nb2tidpl4j4jnoxr.onion.

    ServerName nb2tidpl4j4jnoxr.onion

Next, we will disable Apache’s mod_status module to turn off status information:

    sudo a2dismod status

Now we need to create a virtual host so Nginx knows which directory to serve content from when our hidden service is accessed. Using our text editor, we will create a new server block file:

    sudo nano /etc/apache2/sites-available/hidden_service

In the empty file, paste the following configuration block. Make sure that the server_name field contains your onion address which you read from the hostname file earlier and not my address, nb2tidpl4j4jnoxr.onion.

    <VirtualHost *:80>

    ServerName  nb2ticpl4j4hnoxq.onion

    DirectoryIndex index.html
    DocumentRoot /var/www/hidden_service/

    CustomLog /dev/null common

    </VirtualHost>

After saving the file, we need to symlink it to the sites-enabled directory and then restart Nginx:

    sudo ln -s /etc/apache2/sites-available/hidden_service /etc/apache2/sites-enabled/hidden_service
    sudo service apache2 restart