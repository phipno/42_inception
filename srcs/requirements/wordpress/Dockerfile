FROM alpine:3.19

LABEL build-date="2023-12-15T14:39:42Z"
LABEL maintainer="phipno@gmail.com"

	# Set environment variables
ENV PHP_VERSION 83
ENV DB_USER User_Test
ENV DB_NAME Test
ENV DB_PASS TryTry1234!
ENV WP_URL pnolte.42.fr
ENV WP_TITLE shitty_inception
ENV WP_ADMIN_USER User_Admin
ENV WP_ADMIN_PASS AdminAdmin1234!
ENV WP_EMAIL phipno@gmail.com

RUN apk update

RUN apk add --no-cache zip unzip curl sqlite nginx supervisor mariadb-client

RUN apk add bash
RUN sed -i 's/bin\/ash/bin\/bash/g' /etc/passwd

RUN apk add --no-cache php${PHP_VERSION} \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-pdo \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-phar \
    php${PHP_VERSION}-iconv \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-tokenizer \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-xmlwriter \
    php${PHP_VERSION}-simplexml \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-pdo_mysql \
    php${PHP_VERSION}-pdo_sqlite \
    php${PHP_VERSION}-tokenizer \
    php${PHP_VERSION}-pecl-redis

RUN ln -s /usr/bin/php${PHP_VERSION} /usr/bin/php

WORKDIR /var/www/wordpress

RUN wget \
	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN php${PHP_VERSION} -v
RUN wp core download --allow-root --path=/var/www/wordpress
COPY tools/setup_wordpress.sh /setup_wordpress.sh
RUN chmod +x /setup_wordpress.sh;

ENTRYPOINT ["/setup_wordpress.sh"]

LABEL name="wordpress-alpine-php:8.3"
