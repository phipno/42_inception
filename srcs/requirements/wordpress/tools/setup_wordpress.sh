#!/bin/sh
# set listening port for php fpm
sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf
# sleep 30
rm /var/www/wordpress/wp-config.php
wp config create --allow-root \
	--dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PASS} \
	--dbhost=${DB_HOST} \
	--force
#	--url=${DOMAIN_NAME} \
wp core install --allow-root \
	--title=${WP_TITLE} \
	--url=${DOMAIN_NAME} \
	--admin_user=${WP_ADMIN_USER} \
	--admin_password=${WP_ADMIN_PASS} \
	--admin_email=${WP_ADMIN_EMAIL}
wp user create ${WP_USER} ${WP_USER_EMAIL} \
	--user_pass=${WP_USER_PASS} \
	--allow-root
wp option update home ${DOMAIN_NAME} --allow-root
wp option update siteurl ${DOMAIN_NAME} --allow-root

/usr/sbin/php-fpm${PHP_VERSION} -F -R