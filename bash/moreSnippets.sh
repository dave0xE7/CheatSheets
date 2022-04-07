#!/bin/bash

# ssh history
cat .bash_history | grep '^ssh ' | sort -u

cat /home/*/.bash_history | grep '^ssh ' | sort -u


# show ssh configurations from all users
ls {/root/,/home/*/}.ssh/


# get adresses from ssh known_hosts
cat /home/*/.ssh/known_hosts | awk '{print $1}' | sort -u
cat /home/*/.ssh/known_hosts | awk '{print $1}' | sort -u | grep -v '^|1|'




# get configured hosts
cat .ssh/config | grep 'Host ' | awk '{print $2}'


ssh_config_hosts=$(cat .ssh/config | grep 'Host ' | awk '{print $2}')
echo $ssh_config_hosts 

for item in $ssh_config_hosts; do
	# echo "${item}"
	# ssh-ping -c 1 "${item}" &
	ssh $item 
done



for item in $(cd /var/log; find | grep .log); do
	ls -la 
done

# sort log files 
ls -lat $(cd /var/log; find | grep .log)

ls -t1 $(cd /var/log; find | grep .log)




mate-terminal --disable-factory --sm-client-disable --hide-menubar --title='something' --geometry=80x40+200+200 --command='cmatrix'