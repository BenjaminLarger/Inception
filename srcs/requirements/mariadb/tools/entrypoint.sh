#!/bin/bash

# Start the MySQL server in the background
echo "Starting MySQL server..."
mysqld_safe &

# Wait for the MySQL server to start
echo "Waiting for MySQL server to start..."
while ! mysqladmin ping --silent; do
    sleep 1
done

echo "MySQL server started."

#Create and give permission to a user
commands="CREATE DATABASE IF NOT EXISTS \`${MYSQL_USER}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'${_HOST}' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT USAGE ON *.* TO '${MYSQL_USER}'@'${_HOST}';
GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'${_HOST}';
FLUSH PRIVILEGES;"
echo "Executing SQL commands..."
echo "${commands}" | /usr/bin/mysql -u root -p

#Edit root user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
mysqld_safe &

# Open a bash shell
echo "Opening bash shell..."
exec bash