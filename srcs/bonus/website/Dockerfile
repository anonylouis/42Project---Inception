FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y wget php7.3 php-fpm php-mysql

# Download wordpress 6.0.2 (10/10/2022)
RUN wget https://fr.wordpress.org/wordpress-6.0.2-fr_FR.tar.gz -P /var/www

# extract wordpress
RUN tar -xf /var/www/wordpress-6.0.2-fr_FR.tar.gz -C /var/www/ && rm -rf wordpress-6.0.2-fr_FR.tar.gz
RUN chown -Rv root:root /var/www/wordpress

# configure php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php

# configure wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN sleep 10
RUN wp --info

# entrypoint
COPY ./conf/config_wordpress.sh /
RUN chmod +x /config_wordpress.sh
ENTRYPOINT ["bash", "/config_wordpress.sh"]