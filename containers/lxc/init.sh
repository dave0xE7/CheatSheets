#!/usr/bin/env bash

echo "installing lxc and creating unprivileged containers"


sudo apt-get install lxc -y

lxc-checkconfig

if (( $(id -u) != 0 )); then
    echo "I'm not root"



    echo "$(id -un) veth lxcbr0 10" | sudo tee -a /etc/lxc/lxc-usernet

    mkdir -p ~/.config/lxc
    cp /etc/lxc/default.conf ~/.config/lxc/default.conf
    MS_UID="$(grep "$(id -un)" /etc/subuid  | cut -d : -f 2)"
    ME_UID="$(grep "$(id -un)" /etc/subuid  | cut -d : -f 3)"
    MS_GID="$(grep "$(id -un)" /etc/subgid  | cut -d : -f 2)"
    ME_GID="$(grep "$(id -un)" /etc/subgid  | cut -d : -f 3)"
    echo "lxc.idmap = u 0 $MS_UID $ME_UID" >> ~/.config/lxc/default.conf
    echo "lxc.idmap = g 0 $MS_GID $ME_GID" >> ~/.config/lxc/default.conf

    systemd-run --unit=my-unit --user --scope -p "Delegate=yes" -- lxc-create -t download -n my-container

    systemd-run --unit=my-unit --user --scope -p "Delegate=yes" -- lxc-start my-container

    #You can then confirm its status with either of:

    lxc-info -n my-container
    lxc-ls -f

    #And get a shell inside it with:

    lxc-attach -n my-container

    #Stopping it can be done with:

    lxc-stop -n my-container

    #And finally removing it with:

    lxc-destroy -n my-container

fi