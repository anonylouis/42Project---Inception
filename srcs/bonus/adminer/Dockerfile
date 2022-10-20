FROM debian:buster

RUN apt-get update && apt-get install -y \
    php wget

COPY ./conf/config_adminer.sh /
RUN chmod +x /config_adminer.sh

EXPOSE 9001

ENTRYPOINT [ "bash", "/config_adminer.sh" ]

