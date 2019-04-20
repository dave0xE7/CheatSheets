#!/bin/bash

daemonName=anydaemon
daemonPath=/opt/anydaemon/anyd.sh
daemonDescription="Start the any daemon"

function WriteSbinFile {
	echo '#! /bin/sh' > $1
	echo 'bash '$daemonPath' &>/dev/null &' >> $1
	chmod +x $1
}

function WriteSystemdFile {
	echo '[Unit]' > $1
	echo 'Description='$daemonDescription >> $1
	echo '' >> $1
	echo '[Service]' >> $1
	echo 'Type=oneshot' >> $1
	echo '#ExecStart=/bin/bash '$daemonPath >> $1
	echo 'ExecStart=/bin/bash '$daemonPath >> $1
	echo '' >> $1
	echo '[Install]' >> $1
	echo 'WantedBy=multi-user.target' >> $1
	chmod +x $1
}

function DaemonInstall {
	if [ -e /etc/rc.local ]; then
		echo "$daemonPath; exit 0" > /etc/rc.local
	fi
	if [ -e /etc/crontab ]; then
		echo "*/1 * * * * root $daemonPath" >> /etc/crontab
	fi

	if [ -d /etc/initd ]; then
		cp initd-skeleton.sh /etc/initd/$daemonName
	fi
	
	WriteSbinFile /usr/sbin/$daemonName

	WriteSbinFile /usr/bin/$daemonName

	WriteSystemdFile /etc/systemd/system/$daemonName.service
}

function DaemonPurge {
	if [ -e /etc/initd/$daemonName ]; then
		rm -rf /etc/initd/$daemonName
	fi
	if [ -e /usr/sbin/$daemonName ]; then
		rm -rf /usr/sbin/$daemonName
	fi
	if [ -e /usr/bin/$daemonName ]; then
		rm -rf /usr/bin/$daemonName
	fi
	if [ -e /etc/systemd/system/$daemonName.service ]; then
		rm -rf /etc/systemd/system/$daemonName.service
	fi
}

function DaemonInit {
	systemctl daemon-reload &

	#systemctl stop plug
	systemctl enable plug
	systemctl restart plug &
}