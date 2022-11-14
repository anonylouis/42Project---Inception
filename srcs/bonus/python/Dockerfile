FROM debian:buster

RUN apt-get update && apt-get install -y python python3.7 fcgiwrap spawn-fcgi

#website files
RUN mkdir -p /var/www/python
ADD html /var/www/python/
RUN chmod +x /var/www/python/name.py

# port
EXPOSE 9001

#ENTRYPOINT ["bash"]
ENTRYPOINT ["spawn-fcgi", "-n", "-p", "9001", "-P", "/var/run/spawn-fcgi.pid", "--", "/usr/sbin/fcgiwrap","-f"]

