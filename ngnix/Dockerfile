From alpine:3.15

RUN apk update \
&& apk add nginx

EXPOSE 9900

ENTRYPOINT ["nginx","-g","daemon off;"]
