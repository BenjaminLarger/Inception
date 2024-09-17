FROM debian:10.11

RUN apt-get update \
	&& apt upgrade -y \
	&& apt install nginx -y \
	&& apt install vim -y \
	&& apt install curl -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y \
	&& openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	 -keyout /etc/nginx/ssl/inception.key \
	  -subj "/C=ES/ST=AND/L=Malaga/O=42/OU=42/CN=blarger.42.fr/UID=login"
RUN mkdir -p /var/run/nginx \
	&& chmod 755 /etc/nginx/ssl \
	&& useradd -r -d /var/cache/nginx/ -s /sbin/nologin -U nginx

# wordpress_data volume must be accessible
RUN mkdir -p /var/www/html && chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html \
	&& chmod 755 /var/www/html/* && chown -R www-data:www-data /var/www/html/*

# Copy custom NGINX configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf
#delete
COPY tools/index.html /etc/index.html

# Expose port 443 for HTTPS
EXPOSE 443

# Run NGINX in the foreground
#CMD bash
CMD ["nginx", "-g", "daemon off;"]