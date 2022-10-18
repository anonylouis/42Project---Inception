#!/bin/bash

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]
then
	echo "Database already exists."
else
	service mysql start

	sleep 30
	echo create database
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

	echo create user
	mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

	echo user = root
	mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

	echo create root
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	
	#echo flush
	#mysql -e "FLUSH PRIVILEGES;"

	echo connecting as root
	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
fi
echo starting mariadb
exec mysqld_safe
