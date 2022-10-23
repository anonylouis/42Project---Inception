FROM debian:buster

RUN apt-get update && apt-get install -y \
    nginx

#website files
RUN mkdir -p /var/website/
ADD html /var/website/

# Conf file nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# port
EXPOSE 8080

#ENTRYPOINT ["nginx", "-g", "daemon off;"]

