#!/bin/bash

if [ ! -e loopbackfile.img ]; then
	echo "Creating loopbackfile.img"
	dd if=/dev/zero of=loopbackfile.img bs=100M count=10
	du -sh loopbackfile.img 
	mkfs.ext4 loopbackfile.img
fi

if [ -e loopbackfile.img ]; then

	if [ ! -e /loopfs ]; then
		mkdir /loopfs
		losetup -fP loopbackfile.img
		losetup -a --raw
		mount -o loop /dev/loop0 /loopfs
	fi

	df -hP /loopfs
	mount | grep loopfs

	echo "Hit return to close the loopdevice"
	read if

	umount /loopfs
	rmdir /loopfs

	losetup -d /dev/loop0
	
fi
