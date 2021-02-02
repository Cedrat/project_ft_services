FROM  alpine:3

RUN apk update
RUN apk add --no-cache --upgrade bash
RUN apk add openrc
run mkdir start
RUN apk add rsyslog
RUN apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community
COPY srcs/start.sh ./start
COPY srcs/localhost.pem ./start
COPY srcs/localhost-key.pem ./start
COPY srcs/grafana.ini ./etc/
COPY srcs/grafana.db ./usr/share/grafana/data/
COPY srcs/telegraf.conf ./etc/
EXPOSE 8086
ENTRYPOINT ["/bin/bash", "/start/start.sh"]
