

Sending HTTP POST using CURL

    url='http://invidec.net/api.php'
    data='article=1234'

    curl -s $url -d $data



get Total Memory amount

    free | grep Mem | awk '{print $2}'


get CPU count

    lscpu | grep ^'CPU(s)' | awk '{print $2}'


check if user is root

    if [ $EUID -ne 0 ]; then
        echo "This script must be run as root"
        exit 1
    fi

