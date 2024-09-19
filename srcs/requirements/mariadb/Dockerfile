FROM debian:bullseye

# Update and install necessary packages in a single RUN command
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y tini mariadb-server
    # Create necessary directories, set permissions, and clean up
RUN    mkdir -p /var/lib/mysql && \
		mkdir -p /run/mysqld/ && \
		chown -R mysql:mysql /run/mysqld/ && \
    chown -R mysql:mysql /var/lib/mysql && \
    chmod 755 /var/lib/mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy configuration files and scripts
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb_init.sh /mariadb_init.sh
COPY conf/wordpress.sql /usr/local/bin/wordpress.sql


# Set permissions for script
RUN chmod +x /mariadb_init.sh
RUN chmod 644 /usr/local/bin/wordpress.sql

# Expose the necessary port
EXPOSE 3306

# Set the entrypoint and command
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["bash", "mariadb_init.sh"]
#CMD ["tail", "-f", "/dev/null"]