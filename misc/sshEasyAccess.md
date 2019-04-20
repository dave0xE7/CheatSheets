

## How to use
    
    ssh ld

## instead of

    ssh -X root@192.168.1.167 -p 2222


edit the ssh_config

    sudo nano /etc/ssh/ssh_config

add this to the end of the file

    Host ld
        User root
        Hostname 192.168.1.167
        Port 2222
        ForwardX11 yes