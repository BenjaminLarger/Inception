FROM debian:bookworm

RUN apt-get update \
	&& apt upgrade -y  \
	&& apt install -y apt-transport-https lsb-release ca-certificates wget \
	&& wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
	&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
	&& apt update \
	&& apt install -y php7.4 \
	&& apt install wordpress curl apache2 mariadb-server -y \
	&& wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
#	mysql_secure_installation ask for password


#	&& apt -y install software-properties-common \
#	&& add-apt-repository ppa:ondrej/php
#	&& sudo apt -y install php7.4
#	&& apt-get install -y php7.4 php-fpm php-mysql mariadb-client 