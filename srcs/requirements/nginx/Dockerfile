FROM debian:10.11

# Update and install necessary packages in a single RUN command
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        nginx \
        vim \
        curl \
        openssl && \
    # Create necessary directories and set permissions
    mkdir -p /etc/nginx/ssl /var/run/nginx /var/www/html && \
    chmod 755 /etc/nginx/ssl /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    # Generate SSL certificate
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/ST=AND/L=Malaga/O=42/OU=42/CN=blarger.42.fr/UID=login" && \
    # Add nginx user
    useradd -r -d /var/cache/nginx/ -s /sbin/nologin -U nginx && \
    # Clean up
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy custom NGINX configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copy custom index.html file
COPY tools/index.html /etc/index.html

# Expose port 443 for HTTPS
EXPOSE 443

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]