#!/bin/sh
# set listening port for php fpm
until mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -e '' 2>/dev/null;do
	echo "waiting for mariadb..."
	sleep 1
done

# rm /var/www/wordpress/wp-config.php
wp config create --allow-root \
	--dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PASS} \
	--dbhost=${DB_HOST} \
	--force
#	--url=${DOMAIN_NAME} \
wp core install --allow-root \
	--title=crapCeption \
	--url=${DOMAIN_NAME} \
	--admin_user=${WP_ADMIN_USER} \
	--admin_password=${WP_ADMIN_PASS} \
	--admin_email=${WP_ADMIN_EMAIL}
wp user create ${WP_USER_NAME} ${WP_USER_EMAIL} \
	--user_pass=${WP_USER_PASS} --role=${WP_USER_ROLE}
wp option update home ${DOMAIN_NAME} --allow-root
wp option update siteurl ${DOMAIN_NAME} --allow-root

sed -i "s|if ( ! defined( 'WP_DEBUG' ) ) {|// if ( ! defined( 'WP_DEBUG' ) ) {|g" /var/www/html/wp-config.php
sed -i "s|define( 'WP_DEBUG', false );|define( 'WP_DEBUG', true );\ndefine( 'WP_DEBUG_LOG', true );|g" /var/www/html/wp-config.php
sed -i "s|}|// }|g" /var/www/html/wp-config.php

echo "define('WP_MEMORY_LIMIT', '256M');"" >> /var/www/html/wp-config.php


/usr/sbin/php-fpm${PHP_VERSION} -F