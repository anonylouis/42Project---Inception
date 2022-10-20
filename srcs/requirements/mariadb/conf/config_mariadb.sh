#!/bin/bash


if [ "$(ls -A /var/lib/mysql)" ];then
    service mysql start 2> /dev/null;
fi

#Check if the database exists

if [ -f /is_install ]
then 

	echo "Database already exists"
else

    echo "Need to config wordpress DB"
    killall mysqld
    mysql_install_db &> /dev/null;
    service mysql start 2> /dev/null;

    mysql -e "DELETE FROM mysql.user WHERE User='';";
    mysql -e "CREATE DATABASE $SQL_DATABASE;";
    mysql -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';";
    mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';";
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';FLUSH PRIVILEGES;";
    touch /is_install

fi

killall mysqld
echo "mariadb ready"
mysqld
