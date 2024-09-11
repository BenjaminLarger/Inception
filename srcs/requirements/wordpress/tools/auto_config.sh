#!/bin/bash

# Wait MariaDB to launch correctly
while ! mysqladmin ping -h mariadb --silent; do
    echo "MariaDB is not ready yet. Waiting..."
    sleep 2
done

if [ ! -f /var/www/wordpress/wp-config.php ]; then
		echo "create wp-config.php file"
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WORDPRESS_DB_HOST --path='/var/www/wordpress'
		wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root
else
	echo "wp-config.php already exist at /var/www/wordpress"
fi
#wp core install
#wp user create
# Open a bash shell
echo "Opening bash shell..."
exec bash