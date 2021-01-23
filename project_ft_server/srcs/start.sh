#!/bin/bash

service nginx start
service mysql start
cd /
mysql -u root  < start/start.sql
mkdir /var/www/html/phpmyadmin/tmp
chmod 777 /var/www/html/phpmyadmin/tmp
mysql -u root < start/phpmyadmin.sql
rm /var/www/html/index.html
cp /var/www/html/index.nginx-debian.html /var/www/html/index.html
[[ ! -z  "$AUTO_I" ]] || AUTO_I=0
if [ "$AUTO_I" == "1" ]; then cp ./start/default_ai ./etc/nginx/sites-available/default ; fi
service mysql reload
service nginx restart
mysql -u root < start/wordpress.sql
service php7.3-fpm start
tail -f /dev/null
