#!/bin/bash

export PATH=$PATH:/usr/local/mysql/bin

if [ ! -e /var/www/wordpress/wp-config.php ]
then
	echo installing wordpress
	#sleep 60
	#wp config create --allow-root --path='/var/www/wordpress' --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306
	#wp core install --allow-root --url=lcalvie.42.fr --title=Inception --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --path='/var/www/wordpress'
	#wp user create --allow-root $WP_USER1_LOGIN $WP_USER1_EMAIL --user_pass=$WP_USER1_PASSWORD --path='/var/www/wordpress'
else
	echo wordpress already installed
fi

echo launching wordpress

php-fpm7.3 -F
