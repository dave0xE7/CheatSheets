#!/bin/bash


sudo apt-get install lxc -y
sudo apt-get install lxc-templates -y

lxc-ls -f


# dialog \
#                                              --begin 2 2 --yesno "" 0 0 \
#                   --and-widget               --begin 4 4 --inputbox "name:" 0 0 \
#                   --and-widget               --begin 6 6 --yesno "" 0 0