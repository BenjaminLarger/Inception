#!/bin/bash

# Wait MariaDB to launch correctly
sleep 10

if [ -f /var/www/wordpress/wp-config.php]
	wwp config create	--allow-root \
											--dbname=$MYSQL_DATABASE \
											--dbuser=$MYSQL_USER \
											--dbpass=$MYSQL_PASSWORD \
											--dbhost=mariadb:3306 --path='/var/www/wordpress'

# Open a bash shell
echo "Opening bash shell..."
exec bash