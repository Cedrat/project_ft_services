#!/bin/bash
openrc
touch /run/openrc/softlevel
rc-service telegraf start
rc-service vsftpd start
sleep 10
tail -f /dev/null
