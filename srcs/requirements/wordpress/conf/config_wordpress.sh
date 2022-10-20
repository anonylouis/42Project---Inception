#!/bin/bash

if [ -f /is_install ]
then
	echo "wordpress already downloaded"
else
	#Download wordpress
	wget https://wordpress.org/latest.tar.gz -P /var/www/html/
	tar -xzvf /var/www/html/latest.tar.gz -C /var/www/html/
	rm -rf /var/www/html/latest.tar.gz

	sleep 30

	#Update configuration file
	rm -rf /etc/php/7.3/fpm/pool.d/www.conf
	mv /var/www/html/www.conf /etc/php/7.3/fpm/pool.d/

	#Inport env variables in the config file
	sed -i "s/username_here/$SQL_USER/g" /var/www/html/wordpress/wp-config-sample.php
	sed -i "s/password_here/$SQL_PASSWORD/g" /var/www/html/wordpress/wp-config-sample.php
	sed -i "s/localhost/$SQL_HOSTNAME/g" /var/www/html/wordpress/wp-config-sample.php
	sed -i "s/database_name_here/$SQL_DATABASE/g" /var/www/html/wordpress/wp-config-sample.php
	mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
	touch /is_install
fi

echo "wordpress ready"
/usr/sbin/php-fpm7.3 -F
