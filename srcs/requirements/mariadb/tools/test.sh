#!/bin/bash

# Start the MySQL server in the background
echo "Initializing mysql"
chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user=mysql --ldata=/var/lib/mysql

echo "start mysql"
/etc/init.d/mysql start

until mysqladmin ping -h "localhost" --silent; do
    echo "Waiting for MySQL to start..."
    sleep 2
done

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already exists"

else
mysql_secure_installation << _EOF_

y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
y
y
y
_EOF_

echo "Grant all priviledge sql user"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; FLUSH PRIVILEGES;"

echo "Create database"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

echo "Import database in the mysql commqnd line"
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

echo "stop mysql"
/etc/init.d/mysql stop

# Wait for MySQL to stop
until [ ! -S /var/run/mysqld/mysqld.sock ]; do
    echo "Waiting for MySQL to stop..."
    sleep 2
done

echo "end script entrypoint"
exec "$@"