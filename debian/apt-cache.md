

# The apt-cache command

### contains information about packages

    /var/lib/apt/lists

### contains already downloaded packages

    /var/cache/apt/archives


### can do keyword-based package searches

    apt-cache search <package>

### displays the header of the packages available version

    apt-cache show <package>

### dependencies

    apt-cache depends <pkg>         # shows dependencies
    apt-cache rdepends <pkg>        # shows reverse depend.

### more

    apt-cache policy        # priorities of pkg sources 
    apt-cache dumpavail     # header of all avail. versions
    apt-cache pkgnames      # displays list of avail. pkgs

# Apt-Cacher Server

    sudo apt-get install apt-cacher-ng -y
    sudo systemctl restart apt-cacher

Import existing cached Packages

    sudo /usr/share/apt-cacher/apt-cacher-import.pl -l /var/cache/apt/archives

Load Packages from Server on CD

    sudo mount -o loop /home/username_or_other_path/ubuntu-<image-version>-<image-type>-<arch>.iso /media/cdrom0

    sudo /usr/share/apt-cacher/apt-cacher-import.pl -R -r /media/cdrom0

Configure the Servers Apt Process to run through the cache

create and edit this config file

    sudo nano /etc/apt/apt.conf.d/01proxy

and add this line

    Acquire::http::Proxy "http://<IP address or hostname of the apt-cacher server>:3142";


## CLient Configuration Options

### Method 1: Modify your sources.list

In client /etc/apt/sources.list insert apt-cacher-server:3142 in each line, i.e.

    deb http://archive.ubuntu.com/ubuntu/ precise main restricted 

becomes

    deb http://apt-cacher-server:3142/archive.ubuntu.com/ubuntu/ precise main restricted     

### Methdo 2: Use as a proxy to APT

In a terminal, type:

    sudo nano /etc/apt/apt.conf.d/01proxy

Inside your new file, add a line that says:

    Acquire::http::Proxy "http://<IP address or hostname of the apt-cacher server>:3142";

