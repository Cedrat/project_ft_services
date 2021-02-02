#!/bin/bash
openrc
touch /run/openrc/softlevel
rc-service telegraf start
chown root /etc/vsftpd/vsftpd.conf
rc-service vsftpd start
sleep 10
tail -f /dev/null
