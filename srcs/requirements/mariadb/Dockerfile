FROM debian:buster

RUN apt-get update\
	&& apt upgrade -y \
	&& apt install mariadb-server mariadb-client -y 
#&& sudo mysqld_safe & <enter $MYSQL_ROOT_PASSWORD password>

EXPOSE 3306

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#ENTRYPOINT service mysql start && mysqld_safe


#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]

# Set environment variables MySQL
#ENV MYSQL_ROOT_PASSWORD=my-secret-pw
##Launch SQL ====> mysqld_safe & ; mysql -u root -p

