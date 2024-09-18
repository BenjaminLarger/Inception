#!/bin/bash

# Wait MariaDB to launch correctly
#while ! mysqladmin ping -h mariadb --silent; do
#    echo "MariaDB is not ready yet. Waiting..."
#    sleep 2
#done

if [ ! -f /var/www/html/wp-config.php ]; then
		echo "wp-config.php does not exist "
		wp core download --allow-root --path='/var/www/wordpress'
		wp config create --allow-root --dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 --path='/var/www/wordpress'

		wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE \
		--admin_user=$ADMIN_SITE --admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL --path='/var/www/wordpress' \
		--allow-root

		wp user create $USER_LOGIN $USER_EMAIL \
		--role=author --user_pass=$USER_PASSWORD \
		--path='/var/www/wordpress' \
		 --allow-root
		
		##Customization
		#Change theme
		wp theme install twentytwentytwo --path='/var/www/wordpress' --allow-root
		wp theme activate twentytwentytwo --path='/var/www/wordpress' --allow-root
		#Background
		wp theme mod set background_color '000000' --path='/var/www/wordpress' --allow-root
		#Blogname
		wp option update blogname 'Inception' --path='/var/www/wordpress' --allow-root
		#Wallpaper
		cp /media/Inception.jpg /var/www/html/wp-content/themes/twentytwentytwo/assets/images/flight-path-on-transparent-d.png
		#Apply changes
		cp -r /var/www/wordpress/* /var/www/html/
else
	echo "wp-config.php already exist at /var/www/html"
fi
/usr/sbin/php-fpm7.3 -F