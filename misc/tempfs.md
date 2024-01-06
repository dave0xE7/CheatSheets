


 mount -t tmpfs -o size=100M,mode=1777 thisTest /mnt/tmpfs


 mount -t tmpfs -o size=100M,mode=1777 thisTest /mnt/tmpfs
 mount -t tmpfs -o size=100M,mode=1777 <name> /<path>
 mount -t tmpfs <name> /<path>



    - During  a  remount  operation  (mount -o remount),  the  filesystem size can be changed
          (without losing the existing contents of the filesystem).


## Making TMPFS Persistent
For TMPFS to be available post-reboot:

TMPFS for Temporary Files
      tmpfs /mnt/mytmpfs tmpfs defaults,size=512M 0 0

Add the above line to /etc/fstab. This ensures the TMPFS mount persists across system reboots.

Replace the traditional /tmp directory with TMPFS:
      tmpfs /tmp tmpfs defaults,nosuid,nodev 0 0

For web servers storing session data:
      tmpfs /var/www/sessions tmpfs defaults,size=128M 0 0

TMPFS for Application Cache
      tmpfs /var/www/app/cache tmpfs defaults,size=256M 0 0


### TMPFS for Log Buffering

Buffer logs in TMPFS before batch-writing them to disk:
tmpfs /var/log/buffer tmpfs defaults,size=128M 0 0

Monitoring TMPFS Usage
df -h | grep tmpfs