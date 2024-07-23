FROM debian:11

RUN apt-get update \
	&& apt upgrade \
	&& apt install nginx -y \
	&& apt install vim -y \
	&& apt install curl -y \
	&& mkdir -p /etc/nginx/ssl && chmod 700 /etc/nginx/ssl \
	&& apt install openssl -y \
	&& openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 \
	-subj "/CN=ullorent.42.fr" -keyout /etc/nginx/ssl/server.key -out \
	/etc/nginx/ssl/server.crt

COPY nginx.conf /etc/nginx/nginx.conf
#COPY ssl/ /etc/nginx/ssl/

#EXPOSE 443

#CMD ["nginx", "-g", "deamon off;"]


