#!/bin/bash

if [ -f /is_configure ]
then
	echo "FTP already installed"
	sleep 20
else
	sleep 60
	echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | adduser --gecos "" $FTP_USER
	echo "$FTP_USER" > /etc/vsftpd.chroot_list
	chown -R $FTP_USER /var/www/html
	touch /is_configure
fi

echo "ftp ready"
vsftpd /etc/vsftpd.conf

