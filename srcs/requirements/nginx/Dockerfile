FROM debian:11

RUN apt-get update \
	&& apt upgrade -y \
	&& apt install nginx -y \
	&& apt install vim -y \
	&& apt install curl -y \
	&& mkdir -p /etc/nginx/ssl \
	&& apt install openssl -y \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" \
	&& mkdir -p /var/run/nginx \
	&& chmod 755 /etc/nginx/ssl \
	&& useradd -r -d /var/cache/nginx/ -s /sbin/nologin -U nginx

# Copy custom NGINX configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS
EXPOSE 443

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]