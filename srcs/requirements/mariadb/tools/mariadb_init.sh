#!/bin/bash

sed -i "s/MDB_DB_NAME/${MYSQL_DATABASE}/g" /usr/local/bin/wordpress.sql
sed -i "s/MDB_USER_NAME/${MYSQL_USER}/g" /usr/local/bin/wordpress.sql
sed -i "s/MDB_USER_PASS/${MYSQL_PASSWORD}/g" /usr/local/bin/wordpress.sql
sed -i "s/MDB_ROOT_PASS/${MYSQL_ROOT_PASSWORD}/g" /usr/local/bin/wordpress.sql

chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql


if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --basedir=/usr/ --ldata=/var/lib/mysql/
fi

mysqld --init-file=/usr/local/bin/wordpress.sql