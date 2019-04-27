
Package Installation

    sudo apt-get install unionfs-fuse

sudo mount -t unionfs -o dirs=/lower,/upper none /workdir

cd-rom patch example

    # mount -t unionfs -o dirs=/tmp/cdpatch,/mnt/cdrom \
    > none /mnt/patched-cdrom

sourcecode example

    # mount -t unionfs -o \
    > dirs=/home/cpw/linux:/usr/src/linux=ro \
    > none /home/cpw/linux-src