FROM debian:10.11

RUN apt-get update \
	&& apt upgrade -y  \
	&& apt install curl -y \
	&& apt-get -y install wget \
	&& apt-get install -y php7.3\
	php-fpm \
	php-mysql \
	mariadb-client

#RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
#RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
##RUN	chown -R root:root /var/www/wordpress----> blank line wait
##RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#WORKDIR /var/www/wordpress

# Create a user
##RUN useradd -m -d /home/wpuser -s /bin/bash wpuser
CMD bash

#	mysql_secure_installation ask for password
#We add clear_env=no and 


COPY conf/php.ini /etc/php/8.2/fpm/php.ini
COPY conf/wp-config-sample.php /var/www/wordpress/wp-config.php
COPY tools/auto_config.sh /auto_config.sh
##RUN chmod +x /auto_config.sh
##RUN mkdir -p /var/www/wordpress
##ENTRYPOINT ["/auto_config.sh"]
