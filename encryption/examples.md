# Encryption on linux

## GnuPG

    $ sudo apt-get install gnupg

    $ gpg -c ~/test.txt
    $ ls -l ~/.

    $ rm ~/test.txt
    $ gpg ~/test.txt.gpg

    $ cat test.txt

## CCrypt

    $ sudo apt-get install ccrypt

    ccencrypt file.txt

    ccdecrypt file.txt.cpt

## fscrypt

For ext4, the file system on which encryption is to be used must have the encrypt feature flag enabled. To enable it, run:

    tune2fs -O encrypt /dev/device


    fscrypt setup

This creates the file /etc/fscrypt.conf and the directory /.fscrypt.

Then, if the file system on which encryption is to be used is not the root file system, also run:

    fscrypt setup mountpoint

where mountpoint is where the file system is mounted, e.g. /home.

This creates the directory mountpoint/.fscrypt to store fscrypt policies and protectors.

#### To encrypt an empty directory, run:

    fscrypt encrypt dir

[fscrypt arch wiki]https://wiki.archlinux.org/title/Fscrypt

### Encrypt a home directory

    mkdir /home/newhome
    chown user:user /home/newhome
    fscrypt encrypt /home/newhome --user=user

    cp -a -T /home/user /home/newhome

    fscrypt status /home/newhome

    mv /home/user /home/oldhome
    mv /home/newhome /home/user
    reboot

If everything is working as expected, delete the old home directory:

    find /home/oldhome -type f -print0 | xargs -0 shred -n1 --remove=unlink
    rm -rf /home/oldhome
