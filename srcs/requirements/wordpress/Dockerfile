# Use Alpine Linux as the base image
FROM debian:bookworm

# Install PHP and WordPress dependencies
RUN	apt-get update && \
	apt-get install -y	\
	curl \
	mariadb-client \
	php7.3 \
	php7.3-fpm \
	php7.3-curl \
	php7.3-mysql \
	php7.3-mbstring \
	php7.3-xml \
	php7.3-zip \
	php7.3-gd \
	php7.3-imap

# Create a directory for WordPress
RUN mkdir -p /var/www/html ; mkdir -p /run/php

# Download and extract WordPress
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
  mv wp-cli.phar /usr/local/bin/wp

# PHP-FPM configuration is done in the file www.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# WordPress installation script is imported in /usr/local/bin to be executed as entrypoint
COPY ./tools/setup_wordpress.sh /usr/local/bin/

# Expose port
EXPOSE 9000

ENTRYPOINT ["setup_wordpress.sh"]

# Start PHP-FPM
CMD ["php-fpm7.3", "-F"]
