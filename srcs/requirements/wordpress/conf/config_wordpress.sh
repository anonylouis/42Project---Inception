#!/bin/bash

export PATH=$PATH:/usr/local/mysql/bin

wp config create --allow-root --path='/var/www/wordpress' --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306


php-fpm7.3 -F
