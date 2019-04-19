

Sending HTTP POST using CURL

    url='http://invidec.net/api.php'
    data='article=1234'

    curl -s $url -d $data



get Total Memory amount

    free | grep Mem | awk '{print $2}'


get CPU count

    lscpu | grep ^'CPU(s)' | awk '{print $2}'


check if user is root

~~~bash
if [ $EUID -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi
~~~

~~~bash
#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "I am not root!"
   exit 1
fi
~~~

get creation time of file in unixtime

~~~bash
myTime=$(ls -1 -l --time-style=+%s 1.apk | awk '{print $6}')
echo $myTime
# 1555697968
date --date=@$myTime
# Do Feb 21 14:53:38 CET 2019
~~~




Set position of the Cursor in a Terminal

    # tput cup $row $col
    tput cup 5 10

Read Number of Characters

    read -n 10

Read with Timeout

    read -t 3

Read with hidden input

    read -s


Show possible completions for a command

    # for command
    compgen -bcg

arguments for compgen

    -f      files
    -d      directories
    -u      users
    -v      variable

### Change Terminal Title

~~~bash
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
~~~

### Bash Terminal Colors

~~~bash
# 1 is bold 
# foreground 30-37
# background 40-47
printf "\e[31mCOLORIZED\e[m\n"
~~~

~~~bash
for c in {0..200}; do printf "\e["$c"mCOLORIZED\e[m\n"; done;
~~~



















