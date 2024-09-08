#!/bin/bash

# Start the MySQL server in the background
echo "Starting MySQL server..."
mysqld_safe &

# Wait for the MySQL server to start
echo "Waiting for MySQL server to start..."
while ! mysqladmin ping --silent; do
    sleep 1
done

# Debug: Print environment variables
echo "MYSQL_USER: ${MYSQL_USER}"
echo "MYSQL_PASSWORD: ${MYSQL_PASSWORD}"
echo "MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}"
echo "_HOST: ${_HOST}"
echo "MYSQL_DATABASE: ${MYSQL_DATABASE}"

echo "MySQL server started."

# Create a database (if the database does not exist)
echo "Creating database if it does not exist..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
# Create a user with a password (if the user does not exist)
echo "Creating user if it does not exist..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT USAGE ON *.* TO '${MYSQL_USER}'@'${_HOST}'; GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'${_HOST}';"

# Give all privileges to the user
echo "Granting usage privileges to the user..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT USAGE ON *.* TO '${MYSQL_USER}'@'${_HOST}'; GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'${_HOST}';"

# Reload the database
echo "Flushing privileges..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

echo "Shutdown"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown


echo "Restart"
mysqld_safe &

# Open a bash shell -> delete
#echo "Opening bash shell..."
#exec bash
