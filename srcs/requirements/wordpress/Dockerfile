FROM debian:buster

RUN apt-get update && apt-get -y install \
wget \
php php-cgi php-mysql php-fpm php-pdo php-gd php-cli php-mbstring php-redis

#php-fpm7.3 configuration file (listen = 0.0.0.0:9000)
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#avoid errors when running php
RUN mkdir -p /run/php

#entrypoint
COPY ./conf/config_wordpress.sh /config_wordpress.sh
RUN chmod +x /config_wordpress.sh

EXPOSE 9000

ENTRYPOINT ["bash", "/config_wordpress.sh"]

