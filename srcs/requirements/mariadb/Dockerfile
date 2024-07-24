FROM debian:11

RUN apt-get update \
	&& apt upgrade -y \
	&& apt install mariadb-server mariadb-client -y \
	&& apt install vim -y \
	&& apt install sudo
	#apt-get install mysql-server -y 
#&& apt install systemd \

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3306
ENTRYPOINT ["/entrypoint.sh"]
# Copy custom NGINX configuration file
#COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS

# Run NGINX in the foreground
#CMD ["sh", "-c", "service mysql start && tail -f /dev/null"]