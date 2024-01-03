FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY tools/setup_mariadb.sh /
RUN chmod +x /setup_mariadb.sh;

ENTRYPOINT ["/setup_mariadb.sh"]

EXPOSE 3306

CMD ["mysqld_safe"]