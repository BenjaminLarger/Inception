#!/bin/bash

# Wait MariaDB to launch correctly
#while ! mysqladmin ping -h mariadb --silent; do
#    echo "MariaDB is not ready yet. Waiting..."
#    sleep 2
#done

if [ ! -f /var/www/wordpress/wp-config.php ]; then
		echo "Download wordpress"
		cd /var/www
		wget https://wordpress.org/latest.tar.gz
		tar -xzvf latest.tar.gz
		rm latest.tar.gz
		cd wordpress
		sed "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php > wp-config-sample.php.tmp
		mv wp-config-sample.php.tmp wp-config-sample.php
		sed "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php > wp-config-sample.php.tmp 
		mv wp-config-sample.php.tmp wp-config-sample.php
		sed '/put your unique phrase here/d' wp-config-sample.php > wp-config-sample.php.tmp
		curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> wp-config-sample.php.tmp
		mv wp-config-sample.php.tmp wp-config-sample.php
else
	echo "wp-config.php already exist at /var/www/wordpress"
fi

echo "$@"
