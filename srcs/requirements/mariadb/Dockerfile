FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install mariadb-server mariadb-client -y


COPY conf/my.cnf /root/.my.cnf

RUN mkdir /usr/share/mariadb
WORKDIR /usr/share/mariadb

RUN ["/usr/bin/install" , "-m", "755", "-o", "mysql", "-g", "root", "-d", "/var/run/mysqld"]

# entrypoint
#COPY ./conf/test.txt /test.txt
COPY ./conf/config_mariadb.sh /config_mariadb.sh
#COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /config_mariadb.sh

EXPOSE 3306

ENTRYPOINT ["bash", "/config_mariadb.sh"]
