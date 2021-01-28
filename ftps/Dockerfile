FROM  alpine:3

USER root
RUN apk update
RUN apk add --no-cache --upgrade bash
RUN apk add openrc
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community
RUN apk add vsftpd
run mkdir start
run mkdir files
run adduser -D admin
run passwd -d admin

COPY srcs/start.sh ./start
COPY srcs/telegraf.conf ./etc/
COPY srcs/vsftpd.conf /etc/vsftpd/
COPY srcs/localhost.pem ./start/
COPY srcs/localhost-key.pem ./start/

EXPOSE 21

ENTRYPOINT ["/bin/bash", "/start/start.sh"]
