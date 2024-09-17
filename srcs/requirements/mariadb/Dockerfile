FROM debian:10.11

# Update and install necessary packages in a single RUN command
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server mariadb-client && \
    # Create necessary directories, set permissions, and clean up
    mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    chmod 755 /var/lib/mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN chown -R mysql:mysql /var/lib/mysql
# Copy configuration files and scripts
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/entrypoint.sh /entrypoint.sh

# Set permissions for the entrypoint script
RUN chmod +x /entrypoint.sh

# Expose the necessary port
EXPOSE 3306

# Set the entrypoint and command
#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["mysqld", "--bind-address=0.0.0.0"]
CMD ["tail", "-f", "/dev/null"]