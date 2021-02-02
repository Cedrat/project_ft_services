FROM  alpine:3

RUN apk update
RUN apk add --no-cache --upgrade bash
RUN apk add influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community
RUN apk add openrc
run mkdir start
COPY srcs/influxdb.conf etc/
COPY srcs/start.sh ./start
COPY srcs/telegraf.conf ./etc/
ENTRYPOINT ["/bin/bash", "/start/start.sh"]
