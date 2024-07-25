FROM debian:11

RUN apt-get update \
	&& apt upgrade -y \
	&& apt install mariadb-server mariadb-client -y \
	&& apt install vim -y \
	&& apt install sudo 
	#&& sudo mysqld_safe & <enter $MYSQL_ROOT_PASSWORD password>

#I do not think it is madotory to entry directly inside mariadb at the start of the program
#COPY entrypoint.sh /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]

#RUN chmod +x /entrypoint.sh
EXPOSE 3306

# Set environment variables MySQL
#ENV MYSQL_ROOT_PASSWORD=my-secret-pw

