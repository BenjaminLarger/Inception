#!/bin/bash

# Wait MariaDB to launch correctly
#while ! mysqladmin ping -h mariadb --silent; do
#    echo "MariaDB is not ready yet. Waiting..."
#    sleep 2
#done

if [ ! -f /var/www/wordpress/wp-config.php ]; then
		echo "create wp-config.php file"
		wp core download --allow-root
		
else
	echo "wp-config.php already exist at /var/www/wordpress"
fi
#wp core install
#wp user create
# Open a bash shell
echo "Opening bash shell..."
exec bash