FROM debian:stable

RUN apt update && apt install -y wget php8.2 php8.2-fpm php8.2-mysql mariadb-client

RUN mkdir -p /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup.sh /setup.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "setup.sh" ]

CMD ["php-fpm8.2", "-F"]
