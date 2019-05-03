



sudo nano /etc/apt/sources.list

    deb http://deb.torproject.org/torproject.org stretch main
    deb-src http://deb.torproject.org/torproject.org stretch main

run in terminal

    $ gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
    $ gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

run in terminal

    $ apt-get update
    $ apt-get install tor deb.torproject.org-keyring


$ sudo nano /etc/tor/torrc


    Log notice file /var/log/tor/notices.log

    ############### This section is just for location-hidden services ###

    ## Once you have configured a hidden service, you can look at the
    ## contents of the file ".../hidden_service/hostname" for the address
    ## to tell people.
    ##
    ## HiddenServicePort x y:z says to redirect requests on port x to the
    ## address y:z.

    HiddenServiceDir /var/lib/tor/hs_name_of_my_service/
    HiddenServicePort 80 127.0.0.1:80

    #HiddenServiceDir /var/lib/tor/other_hidden_service/
    #HiddenServicePort 80 127.0.0.1:80
    #HiddenServicePort 22 127.0.0.1:22

after saving

    sudo touch /var/log/tor/notices.log
    chown debian-tor:debian-tor /var/log/tor/notices.log
    sudo service tor restart

### checking log

    sudo nano /var/log/tor/notices.log


### Reading the hostname of the new hidden service

/var/lib/tor/hs_name_of_my_service/
<br>
/var/lib/tor/hs_name_of_my_service/hostname

    sudo cat /var/lib/tor/hs_name_of_my_service/hostname
    nb2tidpl4j4jnoxr.onion


### all in one command source

~~~bash
apt install tor -y;
cd /etc/tor;
#mv /etc/tor/torrc /etc/tor/torrc.old;
#mv torrc torrc.old;
echo 'Log notice file /var/log/tor/notices.log' > /etc/tor/torrc;
echo 'HiddenServiceDir /var/lib/tor/first/' >> /etc/tor/torrc;
echo 'HiddenServicePort 80 127.0.0.1:80' >> /etc/tor/torrc
touch /var/log/tor/notices.log;
systemctl restart tor;
cd /var/lib/tor/first;
cat hostname
tail -f /var/log/tor/notices.log;

~~~

### result

    apt install tor -y; mv /etc/tor/torrc /etc/tor/torrc.old; echo 'Log notice file /var/log/tor/notices.log' > /etc/tor/torrc; echo 'HiddenServiceDir /var/lib/tor/first/' >> /etc/tor/torrc; echo 'HiddenServicePort 80 127.0.0.1:80' >> /etc/tor/torrc;











