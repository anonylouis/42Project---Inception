FROM debian:buster

RUN apt-get update && apt-get install -y \
    vsftpd ftp 

RUN mkdir -p /var/run/vsftpd/empty && touch /etc/vsftpd.chroot_list

COPY ./conf/config_ftp.sh /
RUN chmod +x /config_ftp.sh

COPY ./conf/vsftpd.conf /etc/

EXPOSE 20 21 4000-5000

ENTRYPOINT [ "bash", "/config_ftp.sh" ]

