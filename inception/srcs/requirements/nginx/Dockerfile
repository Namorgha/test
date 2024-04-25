FROM debian:stable

RUN apt -y update && apt -y install nginx && apt -y install openssl

RUN chmod 700 /etc/ssl/private

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/key.key -out /etc/ssl/certs/key.crt -subj /C=MA/ST=valfleuri/L=Tanger/O=1337/OU=42Network/CN=namorgha

RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

RUN mkdir -p /var/www/html/wordpress

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

