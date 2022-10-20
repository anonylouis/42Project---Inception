FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install mariadb-server mariadb-client -y

# entrypoint
COPY ./conf/config_mariadb.sh /config_mariadb.sh
RUN chmod +x /config_mariadb.sh

EXPOSE 3306

ENTRYPOINT ["bash", "/config_mariadb.sh"]

