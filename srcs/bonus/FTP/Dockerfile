FROM debian:buster

RUN apt-get update && apt-get install -y \
    vsftpd

COPY ./conf/config_ftp.sh /
RUN chmod +x /config_ftp.sh

ENTRYPOINT [ "bash", "/config_ftp.sh" ]

