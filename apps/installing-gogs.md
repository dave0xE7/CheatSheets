

mysql -u root

    CREATE DATABASE gogs;
    CREATE USER 'gogs'@'localhost' IDENTIFIED BY 'HalloGOGS1337';
    GRANT ALL PRIVILEGES ON gogs.* TO 'gogs'@'localhost';
    FLUSH PRIVILEGES;

#

    apt install sudo wget unzip -y

    useradd -m -s /bin/bash gogs

    sudo -u gogs bash
    cd ~
#

### https://gogs.io/docs/installation/install_from_binary
    wget https://dl.gogs.io/0.12.6/gogs_0.12.6_linux_amd64.zip
    unzip gogs_0.12.6_linux_amd64.zip


## finish installation
    ./gogs/gogs web

## restore backup
    ./gogs/gogs restore --from gogs-backup.zip

## example config file
    BRAND_NAME = Gogs
    RUN_USER   = gogs
    RUN_MODE   = prod

    [database]
    TYPE     = mysql
    HOST     = 127.0.0.1:3306
    NAME     = gogs
    USER     = gogs
    PASSWORD = %%%
    SSL_MODE = disable
    PATH     = /home/gogs/gogs/data/gogs.db

    [repository]
    ROOT = /home/gogs/gogs-repositories

    [server]
    DOMAIN           = gogs-server
    HTTP_PORT        = 3000
    EXTERNAL_URL     = http://gogs-server:3000/
    DISABLE_SSH      = false
    SSH_PORT         = 22
    START_SSH_SERVER = false
    OFFLINE_MODE     = false

    [mailer]
    ENABLED = false

    [service]
    REGISTER_EMAIL_CONFIRM = false
    ENABLE_NOTIFY_MAIL     = false
    DISABLE_REGISTRATION   = true
    ENABLE_CAPTCHA         = true
    REQUIRE_SIGNIN_VIEW    = true

    [picture]
    DISABLE_GRAVATAR        = false
    ENABLE_FEDERATED_AVATAR = false

    [session]
    PROVIDER = file

    [log]
    MODE      = file
    LEVEL     = Info
    ROOT_PATH = /home/gogs/gogs/log

    [security]
    INSTALL_LOCK = true
    SECRET_KEY   = wg38sR86a7r57zK

