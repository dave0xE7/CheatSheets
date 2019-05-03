

### Sending HTTP POST using CURL

    url='http://invidec.net/api.php'
    data='article=1234'

    curl -s $url -d $data



### get Total Memory amount

    free | grep Mem | awk '{print $2}'


### get CPU count

    lscpu | grep ^'CPU(s)' | awk '{print $2}'


### check if user is root

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

### get creation time of file in unixtime

~~~bash
myTime=$(ls -1 -l --time-style=+%s 1.apk | awk '{print $6}')
echo $myTime
# 1555697968
date --date=@$myTime
# Do Feb 21 14:53:38 CET 2019
~~~




### Set position of the Cursor in a Terminal

    # tput cup $row $col
    tput cup 5 10

### Get Size (Lines and Colums) of Terminal Window

    cols=$(tput cols)
    lines=$(tput lines)
    echo 'Terminal Size:' $cols $lines

### Read Number of Characters

    read -n 10

### Read with Timeout

    read -t 3

### Read with hidden input

    read -s


### Show possible completions for a command

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
for c in {0..200}; do printf "$c \e["$c"mCOLORIZED\e[m\n"; done;
~~~

~~~bash
PS1='\e[93m[$(date +%H:%M:%S)]\e[091m[\u\e[91m@\e[91m\h]\e[92m\w\e[097m>\e[00m'
~~~


### Split a string

~~~bash
mails=$(echo $IN | tr ";" "\n")

for addr in $mails
do
    echo "> [$addr]"
done
~~~

### grep condition

    cat work | grep -Po '{.*}'
    {"id":"3","method":"shellCmd","params":"echo idk","time":"1555745970"}
    {"id":"4","method":"shellCmd","params":"echo hello world","time":"1555745975"}
    cat work | grep -Po '{"id":"4".*}'
    {"id":"4","method":"shellCmd","params":"echo hello world","time":"1555745975"}
    cat work | grep -Po '{"id":"3".*}'
    {"id":"3","method":"shellCmd","params":"echo idk","time":"1555745970"}


### Array Count

    myarray=("one" "two" "three")
    echo "${#myarray[@]}"


    IFS=', ' read -a array <<< "Paris, France, Europe"; echo "${array[@]}"


### create random password

    tr -dc A-Za-z0-9_ < /dev/urandom  | head -c12 | xargs

### send notification

    notify-send -a "idk" -i "terminal" "ssh access" "user root entered from ip 194.123.125.42"



### measure disk performance

    echo "writing 1GB of zeros to ./largefile"
    dd if=/dev/zero of=./largefile bs=1M count=1024

    echo "cleaning cache"
    sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"

    echo "reading whole 1GB ./largefile"
    dd if=./largefile of=/dev/null bs=4k

    echo "cleaning up"
    rm -rf ./largefile


### get wifi essid

    essid=$(iwconfig wlp5s0 | grep ESSID | grep -Po '".*?[^\\]"')
    echo ${essid:1:-1}

### check internet connection via http

    status=$(curl -s http://detectportal.firefox.com/success.txt -i)
    if [ $status == "success" ]; then
        echo true
    else
        echo false
    fi


### Diagram for bash terminal

requires package 'dialog'

    sudo apt-get install dialog -y; sudo pacman -S dialog -y; clear

~~~bash
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Backtitle here"
TITLE="Title here"
MENU="Choose one of the following options:"

OPTIONS=(1 "Option 1"
        2 "Option 2"
        3 "Option 3")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1) echo "You chose Option 1" ;;
        2) echo "You chose Option 2" ;;
        3) echo "You chose Option 3" ;;
esac
~~~


