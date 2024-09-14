FROM debian:10.11

RUN apt-get update \
	&& apt upgrade -y  \
	&& apt install curl -y \
	&& apt install wget -y\
	&& apt-get install -y php7.3\
	php-fpm \
	php-mysql \
	mariadb-client


#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

#Volume
RUN mkdir -p /var/www/html && chmod 750 /var/www/html


#Enable php to run
COPY conf/www.conf php/7.3/fpm/pool.d/
RUN mkdir -p /run/php

#Confing wordpress and launch php server
COPY tools/auto_config.sh /auto_config.sh
RUN chmod +x /auto_config.sh
RUN mkdir -p /var/www/wordpress

WORKDIR /var/www
#Configure CLI
RUN curl -f -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp 

ENTRYPOINT ["/auto_config.sh"]

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
#CMD ["/usr/sbin/php-fpm7.3", "-F"]
#CMD ["tail", "-f", "/dev/null"]

