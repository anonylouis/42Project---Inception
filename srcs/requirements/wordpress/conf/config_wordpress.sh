#!/bin/bash

#if wordpress is already installed
if [ -f /is_install ]
then
	echo "wordpress already downloaded"
else
	#Download wordpress
	wget https://wordpress.org/latest.tar.gz -P /var/www/html/ -nv
	tar -xzf /var/www/html/latest.tar.gz -C /var/www/html/
	rm -rf /var/www/html/latest.tar.gz
	
	#Download CLI
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -nv
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	#Be sure the db is well created
	sleep 30

	#Wordpress configuration
	
	# -wp-config.php
	sed -i "s/username_here/$SQL_USER/g" /var/www/html/wordpress/wp-config-sample.php
	sed -i "s/password_here/$SQL_PASSWORD/g" /var/www/html/wordpress/wp-config-sample.php
	sed -i "s/localhost/$SQL_HOSTNAME/g" /var/www/html/wordpress/wp-config-sample.php
	sed -i "s/database_name_here/$SQL_DATABASE/g" /var/www/html/wordpress/wp-config-sample.php
	mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
	
	# -filling wordpress first page
	wp core install --allow-root --url=lcalvie.42.fr --title=Lcalvie_inception --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --path='/var/www/html/wordpress'
	
	# -adding user1
	wp user create --allow-root $WP_USER1_LOGIN $WP_USER1_EMAIL --user_pass=$WP_USER1_PASSWORD --path='/var/www/html/wordpress'
	
	#to configure it only one time
	touch /is_install
fi

echo "wordpress ready"
/usr/sbin/php-fpm7.3 -F
