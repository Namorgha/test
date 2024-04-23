#!bin/sh

cd /var/www/html/wordpress;
if ! -f wp-config.php; then
	if ! wp --allow-root core is-installed; then
		wp core download	--allow-root;
		wp config create	--allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb:3306;
		wp core install		--allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL};
	fi

	wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q ${WP_ADMIN}
	if [ $? != 0 ]; then
		wp user create --allow-root ${WP_ADMIN} ${WP_ADMIN_EMAIL} --role=administrator --user_pass=${WP_ADMIN_PASSWD} --path=/var/www/html/wordpress;
	fi
	wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q ${WP_USER}
	if [ $? != 0 ]; then
		wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --role=editor --user_pass=${WP_USER_PASSWD} --path=/var/www/html/wordpress;
	fi
fi
exec "$@"
