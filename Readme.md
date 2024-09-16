# MariaDB
## Commands
### list user :
mysql -u root -p
SELECT User, Host FROM mysql.user;

##I nspect network
docker network ls
docker network inspect <network name>

## Get logs
docker container logs <containerID>

## Finding the IP Address of the MariaDB Container
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <mariadb_container_id>

##Enter into a container
docker ps
docker exec -it container_name /bin/bash

## Fix mariadb volum corrupted (can't log aria_log_control)
docker volume rm <volume_name>
docker volume create <volume_name>

## Update hosts File (Local Machine)
Open a terminal and edit the hosts file with a text editor:

vim nano /etc/hosts
Add a line mapping your local IP address to mylogin.42.fr. For example:

127.0.0.1 mylogin.42.fr
Save the file and exit the editor. This will allow your local machine to resolve mylogin.42.fr to 127.0.0.1.

## Ensure that the PHP-FPM process is running
docker exec -it wordpress_container_name bash
ps aux | grep php-fpm


# To fix
associate mariadb header with the corresponding IP address

