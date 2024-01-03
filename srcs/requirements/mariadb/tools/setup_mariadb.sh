#!/bin/sh

if [ ! -d /var/lib/mysql/$DB_NAME ]; then
  mkdir -p /auth_pam_tool_dir
  touch /auth_pam_tool_dir/auth_pam_tool
  chown root:root /auth_pam_tool_dir/auth_pam_tool
  mysql_upgrade -u root -p
  /usr/share/mariadb/mysql.server start
  mysql -e "\
    CREATE DATABASE IF NOT EXISTS ${DB_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; \
    CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'; \
    GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}'; \
    FLUSH PRIVILEGES; \
    "
  mysqladmin --user=root --password=$ROOT_PASS shutdown
fi

exec "$@"