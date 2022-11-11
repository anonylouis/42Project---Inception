FROM debian:buster

RUN apt-get update && apt-get install -y python

#website files
RUN mkdir -p /var/www/python
ADD html /var/www/python/

# port
EXPOSE 9001

ENTRYPOINT ["python"]

