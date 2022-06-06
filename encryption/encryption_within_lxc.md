Encryption within Linux Containers (lxc)

Support to use fscrypt inside Linux Containers (lxc), or more generally in mount_namespaces(7) where the file system's root directory is not visible has been added in v0.2.8.
Lock directory when container is stopped

A systemd/User unit within the container can lock an encrypted directory when the container is stopped:

~/.config/systemd/user/lock-directory.service

[Unit]
Description=lock encrypted directory on shutdown
DefaultDependencies=no
Before=shutdown.target

[Service]
Type=oneshot
ExecStart=/bin/sh -c "/usr/bin/fscrypt lock /home/facade/target"
TimeoutStartSec=0

[Install]
WantedBy=shutdown.target
