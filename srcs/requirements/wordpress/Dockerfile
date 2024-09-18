FROM debian:10.11

# Update and install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        curl \
        wget \
        php7.3 \
        php-fpm \
        php-mysql \
        mariadb-client \
        php-gd \
        php-imagick && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create necessary directories and set permissions
RUN mkdir -p /var/www/html /var/www/wordpress /run/php /etc/php/7.3/fpm/pool.d && \
    chown -R www-data:www-data /var/www/html /var/www/wordpress && \
    chmod 750 /var/www/html /var/www/wordpress
		

# Copy configuration files and scripts
COPY tools/wordpress_config.sh /wordpress_config.sh
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/inception.jpg /media/Inception.jpg

# Set permissions for the script
RUN chmod +x /wordpress_config.sh

# Download and configure WP-CLI
RUN curl -f -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Set the working directory
WORKDIR /var/www

# Expose the necessary port
EXPOSE 9000

# Set the entrypoint

#ENTRYPOINT ["/wordpress_config.sh"]

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
#CMD ["/usr/sbin/php-fpm7.3", "-F"]
CMD ["tail", "-f", "/dev/null"]

