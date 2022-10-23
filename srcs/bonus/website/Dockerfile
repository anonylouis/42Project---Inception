FROM debian:buster

RUN apt-get update && apt-get install -y nginx

#website files
RUN mkdir -p /var/website/
ADD html /var/website/

# Conf file nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# port
EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]

