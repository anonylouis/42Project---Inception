FROM debian:buster

RUN apt update -y && apt upgrade -y \
    && apt-get install mariadb-server -y

# mariadb configuration file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# entrypoint
COPY ./conf/config_mariadb.sh /config_mariadb.sh
RUN chmod +x /config_mariadb.sh
ENTRYPOINT ["bash", "/config_mariadb.sh"]
