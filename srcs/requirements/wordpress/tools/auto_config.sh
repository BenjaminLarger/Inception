#!/bin/bash

# Wait MariaDB to launch correctly
#while ! mysqladmin ping -h mariadb --silent; do
#    echo "MariaDB is not ready yet. Waiting..."
#    sleep 2
#done

if [ ! -f /var/www/wordpress/wp-config.php ]; then
		wp core download --allow-root --path='/var/www/wordpress'
		wp config create --allow-root --dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 --path='/var/www/wordpress'

		wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE \
		--admin_user=$ADMIN_SITE --admin_password=$ADMIN_PASSWORD\
		--admin_email=$ADMIN_EMAIL --path='/var/www/wordpress'\
		--allow-root

		wp user create $USER_LOGIN $USER_EMAIL \
		--role=author --user_pass=$USER_PASSWORD\
		 --allow-root

		cp -r /var/www/wordpress/* /var/www/html/
else
	echo "wp-config.php already exist at /var/www/wordpress"
fi
/usr/sbin/php-fpm7.3 -F