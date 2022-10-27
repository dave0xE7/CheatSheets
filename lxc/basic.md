

## list containers and show information
lxc-ls -f

## creating a new container
lxc-create --name container1 --template=debian

lxc-start --name=$NAME
lxc-info $NAME
lxc-stop --name=$NAME
lxc-destroy --name=$NAME

# common options

    Usage: lxc-start --name=NAME -- COMMAND

    lxc-start start COMMAND in specified container NAME

    Options :
    -n, --name=NAME        NAME of the container
    -d, --daemon           Daemonize the container (default)
    -F, --foreground       Start with the current tty attached to /dev/console
    -p, --pidfile=FILE     Create a file with the process id
    -f, --rcfile=FILE      Load configuration file FILE
    -c, --console=FILE     Use specified FILE for the container console
    -L, --console-log=FILE Log container console output to FILE
    -C, --close-all-fds    If any fds are inherited, close them
                            Note: --daemon implies --close-all-fds
    -s, --define KEY=VAL   Assign VAL to configuration variable KEY
        --share-[net|ipc|uts|pid]=NAME Share a namespace with another container or pid

    Common options :
    -o, --logfile=FILE               Output log to FILE instead of stderr
    -l, --logpriority=LEVEL          Set log priority to LEVEL
    -q, --quiet                      Don't produce any output
    -P, --lxcpath=PATH               Use specified container path
    -?, --help                       Give this help list
        --usage                      Give a short usage message
        --version                    Print the version number


# using overlayfs
    lxc-copy --name=base --newname=test1 -B overlayfs -s -F -l INFO


#### container files are located at
/var/lib/lxc/
