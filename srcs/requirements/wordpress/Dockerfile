FROM debian:buster

#Install necessary package from php

RUN apt-get update && apt-get -y install \
wget \
php \
php-cgi \
php-mysql \
php-fpm \
php-pdo \
php-gd php-cli \
php-mbstring

#Copy the necessary tools to download wordpress

COPY ./conf/www.conf /var/www/html/www.conf

#Create the folder to enable php start

RUN mkdir /run/php

#Launch script

COPY ./conf/config_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config_wordpress.sh

EXPOSE 9000
ENTRYPOINT ["config_wordpress.sh"]
