#!/bin/bash

#hostname=$(hostname);
#echo "Current Hostname: $hostname"
read -p "hostname:" -e hostname

hostname "$hostname"
echo $hostname > /etc/hostname

echo "welcome on $hostname debian linux" > /etc/motd

apt-get update -y

apt-get install sudo wget curl less nano git -y
