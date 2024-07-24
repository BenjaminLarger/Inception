FROM debian:11

RUN apt-get update \
	&& apt upgrade -y \
	&& apt install mariadb-server mariadb-client -y \
	&& apt install vim -y

# Copy custom NGINX configuration file
#COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS
#EXPOSE 443

# Run NGINX in the foreground
#CMD ["sh", "-c", "service mysql start && tail -f /dev/null"]