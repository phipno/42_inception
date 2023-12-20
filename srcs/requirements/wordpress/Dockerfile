#FROM alpine:3.19
FROM debian:bookworm

LABEL build-date="2023-12-15T14:39:42Z"
LABEL maintainer="phipno@gmail.com"

ENV PHP_VERSION 8.2

# RUN apk update

# RUN apk add --no-cache curl mariadb-client

# RUN apk add --no-cache php${PHP_VERSION} \

RUN apt update && apt -y install curl mariadb-client php${PHP_VERSION} wget \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-pdo \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-phar \
    php${PHP_VERSION}-iconv \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-curl \
    # php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-tokenizer \
    php${PHP_VERSION}-fileinfo \
    # php${PHP_VERSION}-json \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-xmlwriter \
    php${PHP_VERSION}-simplexml \
    php${PHP_VERSION}-dom \
    # php${PHP_VERSION}-pdo_mysql \
    php${PHP_VERSION}-mysqli 
    # php${PHP_VERSION}-pdo_sqlite \
    # php${PHP_VERSION}-pecl-redis

#set link from php version to php
#RUN ln -s /usr/bin/php${PHP_VERSION} /usr/bin/php

#install wordpress
WORKDIR /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root --path=/var/www/

#setup wordpress script
COPY tools/setup_wordpress.sh /setup_wordpress.sh
RUN chmod +x /setup_wordpress.sh;

#execute wordpress script
ENTRYPOINT ["/setup_wordpress.sh"]

LABEL name="wordpress-alpine-php:8.3"
