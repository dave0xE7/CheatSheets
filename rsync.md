
## Copy/Sync Files and Directory Locally

    rsync -zvh backup.tar.gz /tmp/backups/

## Copy/Sync Files and Directory to or From a Server

    rsync -avzh /root/rpmpkgs root@192.168.0.141:/root/

## Copy/Sync a Remote Directory to a Local Machine

    rsync -avzh root@192.168.0.141:/root/rpmpkgs /tmp/myrpms
