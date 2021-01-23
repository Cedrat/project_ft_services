#!/bin/bash
openrc
touch /run/openrc/softlevel
rc-service grafana start
rc-service telegraf start
cd /usr/share/grafana && /usr/sbin/grafana-server --config=/etc/grafana.ini
tail -f /dev/null
