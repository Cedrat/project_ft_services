FROM debian:buster

RUN apt-get update \
 &&  apt-get -y upgrade \
 && apt-get install --no-install-recommends --no-install-suggests -y ca-certificates libssl1.0 &&  apt-get install -y nginx dpkg lsb-release wget gnupg
#RUN apt-get install -y dpkg
#RUN apt-get install -y lsb-release
#RUN apt-get install -y wget
#RUN apt-get install -y gnup
#Install PHP
RUN  apt install php php-cgi php-mysqli php-pear php-mbstring php-gettext libapache2-mod-php php-common php-phpseclib php-mysql php-fpm -y

#install mariaDB
RUN  apt install mariadb-server mariadb-client -y
#Install phpMyAdmin
RUN wget -P /Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN mkdir /var/www/html/phpmyadmin
RUN tar xvf /Downloads/phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
COPY srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
#install Wordpress
COPY srcs/wordpress var/www/html/wordpress
RUN chown -R www-data:www-data /var/www
RUN mkdir start
COPY srcs/start.sh ./start
COPY srcs/start.sql ./start
COPY srcs/phpmyadmin.sql ./start
COPY srcs/wordpress.sql ./start
COPY srcs/localhost.pem ./start
COPY srcs/localhost-key.pem ./start
COPY srcs/default ./etc/nginx/sites-available/
COPY srcs/default_ai ./start
ENTRYPOINT ["/bin/bash", "/start/start.sh"]

