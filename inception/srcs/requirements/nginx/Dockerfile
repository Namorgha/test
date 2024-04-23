FROM debian:stable

# install nginx and openssl
RUN apt -y update && apt -y install nginx && apt -y install openssl

# give the right permission to /etc/ssl/private
RUN chmod 700 /etc/ssl/private

# create a self-signed key and certificate with OpenSSL and configure it
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/key.key -out /etc/ssl/certs/key.crt -subj /C=MA/ST=valfleuri/L=Tanger/O=1337/OU=42Network/CN=namorgha

# create Diffie-Hellman group
RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

# create our website folders
RUN mkdir -p /var/www/html/wordpress

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

