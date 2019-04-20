
## systemctl
#### for "sytemd" system and service-manager

Display status of a service

    systemctl status sshd

Start/Stop/Restart a service

    systemctl start sshd
    systemctl stop sshd
    systemctl restart sshd

Reload a service

    systemctl reload sshd

Enable/Disable a service

    systemctl enable sshd
    systemctl disable sshd

Check whether service is enabled/active/failed
    
    systemctl is-enabled sshd
    systemctl is-active sshd
    systemctl is-failed sshd



