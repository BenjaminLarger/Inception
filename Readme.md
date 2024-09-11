# MariaDB
## Commands
### list user :
mysql -u root -p
SELECT User, Host FROM mysql.user;

##Inspect network
docker network ls
docker network inspect <network name>

##Get logs
docker container logs <containerID>

##Finding the IP Address of the MariaDB Container
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <mariadb_container_id>

#To fix
associate mariadb header with the corresponding IP address