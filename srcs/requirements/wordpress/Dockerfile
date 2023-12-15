# Use Alpine Linux as the base image
FROM debian:bookworm

# Install PHP and WordPress dependencies
RUN	apt-get update
RUN apt-get install apt-utils curl wget -y
RUN apt-get install php8.2 php8.2-cli php8.2-common php8.2-imap php8.2-redis php8.2-snmp php8.2-xml php8.2-mysqli php8.2-zip php8.2-mbstring php8.2-curl libapache2-mod-php -y

# Create a directory for WordPress
RUN mkdir -p /var/www/html ; mkdir -p /run/php

# Download and extract WordPress
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
  mv wp-cli.phar /usr/local/bin/wp

# PHP-FPM configuration is done in the file www.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# WordPress installation script is imported in /usr/local/bin to be executed as entrypoint
COPY ./tools/setup_wordpress.sh /usr/local/bin/setup_wordpress.sh

# Expose port
EXPOSE 9000

ENTRYPOINT ["bash", "/usr/local/bin/setup_wordpress.sh"]

# Start PHP-FPM
CMD ["php-fpm8.2", "-F"]
