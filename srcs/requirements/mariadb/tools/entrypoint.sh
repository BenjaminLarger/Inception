#!/bin/bash

# Start the MySQL server in the background
mysqld_safe &

# Wait for the MySQL server to start
while ! mysqladmin ping --silent; do
    sleep 1
done


#Create and give permission to a user
#newUser='testuser'
#newDbPassword='testpwd'
#newDb='testdb'
#host=localhost
#TO '${newUser}'@'${host}' IDENTIFIED BY '${newDbPassword}';FLUSH PRIVILEGES;"
#commands="CREATE DATABASE \`${newDb}\`;CREATE USER '${newUser}'@'${host}' IDENTIFIED BY '${newDbPassword}';GRANT USAGE ON *.* TO '${newUser}'@'${host}';GRANT ALL ON \`${newDb}\`.* TO '${newUser}'@'${host}';FLUSH PRIVILEGES;"
#echo "${commands}" | /usr/bin/mysql -u root -p

# Open a bash shell
exec bash