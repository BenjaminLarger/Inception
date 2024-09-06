FROM debian:bookworm

RUN apt-get update \
	&& apt upgrade -y  \
	&& apt-get -y install wget \
	&& apt-get install -y php7.3\
	php-fpm \
	php-mysql \
	mariadb-client 
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
#	mysql_secure_installation ask for password

#We add clear_env=no and 
COPY conf/php.ini /etc/php/8.2/fpm/php.ini

CMD bash

#	&& apt -y install software-properties-common \
#	&& add-apt-repository ppa:ondrej/php
#	&& sudo apt -y install php7.4
#	&& apt-get install -y php7.4 php-fpm php-mysql mariadb-client 