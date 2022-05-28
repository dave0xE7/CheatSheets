# Proxmox Container (proxmox lxc)

## container config

    /var/lib/config/103/config

## containers rootfs path

    ls /rpool/data/subvol-103-disk-0/

    > bin boot dev etc home lib mnt opt proc root run tmp usr var....

### USAGE: pct <COMMAND> [ARGS] [OPTIONS]

    pct clone <vmid> <newid> [OPTIONS]
    pct create <vmid> <ostemplate> [OPTIONS]
    pct destroy <vmid> [OPTIONS]
    pct list
    pct migrate <vmid> <target> [OPTIONS]
    pct move-volume <vmid> <volume> [<storage>] [<target-vmid>] [<target-volume>] [OPTIONS]
    pct pending <vmid>
    pct resize <vmid> <disk> <size> [OPTIONS]
    pct restore <vmid> <ostemplate> [OPTIONS]
    pct template <vmid>

    pct config <vmid> [OPTIONS]
    pct set <vmid> [OPTIONS]

    pct delsnapshot <vmid> <snapname> [OPTIONS]
    pct listsnapshot <vmid>
    pct rollback <vmid> <snapname>
    pct snapshot <vmid> <snapname> [OPTIONS]

    pct reboot <vmid> [OPTIONS]
    pct resume <vmid>
    pct shutdown <vmid> [OPTIONS]
    pct start <vmid> [OPTIONS]
    pct stop <vmid> [OPTIONS]
    pct suspend <vmid>

    pct console <vmid> [OPTIONS]
    pct cpusets
    pct df <vmid>
    pct enter <vmid>
    pct exec <vmid> [<extra-args>]
    pct fsck <vmid> [OPTIONS]
    pct fstrim <vmid> [OPTIONS]
    pct mount <vmid>
    pct pull <vmid> <path> <destination> [OPTIONS]
    pct push <vmid> <file> <destination> [OPTIONS]
    pct rescan  [OPTIONS]
    pct status <vmid> [OPTIONS]
    pct unlock <vmid>
    pct unmount <vmid>

    pct help [<extra-args>] [OPTIONS]

# useful ref

https://tweenpath.net/permanent/useful-proxmox-lxc-commands/
