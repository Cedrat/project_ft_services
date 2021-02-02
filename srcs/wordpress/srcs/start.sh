#!/bin/bash
openrc
touch /run/openrc/softlevel
service nginx start
rc-service telegraf start
rc-service php-fpm7 start
#reste a config mysql
tail -f /dev/null
