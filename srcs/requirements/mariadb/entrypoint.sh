#!/bin/bash

# Start the MySQL server in the background
sudo mysqld_safe &

# Wait for the MySQL server to start
while ! mysqladmin ping --silent; do
    sleep 1
done

# Set the root password using the environment variable
mysql -u root <<-EOSQL
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOSQL

# Keep the container running
#tail -f /dev/null #delete
#sudo mysqld_safe &
#sudo mysql -u root -p

