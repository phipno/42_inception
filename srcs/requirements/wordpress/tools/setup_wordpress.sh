#!/bin/sh
# set listening port for php fpm
sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf
# waiting for the database to be ready - could be done in loop too
sleep 30
wp config create --allow-root \
									--dbname=${DB_NAME} \
									--dbuser=${DB_USER} \
									--dbpass=${DB_PASS} \
									--url=${DOMAIN_NAME} \
									--force
wp core install --allow-root \
								--title=${WP_TITLE} \
								--url=${DOMAIN_NAME} \
								--admin_user=${WP_ADMIN_USER} \
								--admin_password=${WP_ADMIN_PASS} \
								--admin_email=${WP_ADMIN_EMAIL}
wp user create ${WP_USER} ${WP_USER_EMAIL} \
								--allow-root \
								--user_pass=${WP_USER_PASS}
wp option update home ${DOMAIN_NAME}
wp option update siteurl ${DOMAIN_NAME}

php-fpm -f