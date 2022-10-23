#!/bin/bash

#Download adminer.php page
wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -P /var/www/html/wordpress/ -q

mv /var/www/html/wordpress/adminer-4.8.1.php /var/www/html/wordpress/adminer.php

echo "adminer page ready"
php -S [::]:9001 -t /var/www/html
