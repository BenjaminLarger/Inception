#!/bin/bash

# Start the MySQL server in the background
echo "Starting MySQL server..."
mysqld_safe &

# Wait for the MySQL server to start
while ! mysqladmin ping --silent; do
echo "Waiting for MySQL server to start..."
    sleep 1
done

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	echo "Database already exist."

else
echo "MySQL server started."

# Create a database (if the database does not exist)
echo "Creating database if it does not exist..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
# Create a user with a password (if the user does not exist)

echo "Creating user if it does not exist..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'${_HOST}' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Give all privileges to the user
echo "Granting usage privileges to the user..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; FLUSH PRIVILEGES;"
#mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT USAGE ON *.* TO '${MYSQL_USER}'@'${_HOST}'; GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'${_HOST}';"

# Reload the database
echo "Flushing privileges..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# Shutdown the MySQL server
echo "Shutdown"
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown


echo "Restart"
mysqld_safe &
fi
exec "$@"
# Open a bash shell -> delete
#echo "Opening bash shell..."
#exec bash
