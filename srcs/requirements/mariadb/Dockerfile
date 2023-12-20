FROM alpine:3.19

RUN apk update 
RUN apk add mariadb mariadb-client openrc

RUN openrc
RUN touch /run/openrc/softlevel

COPY conf/mariadb.conf /etc/my.cnf.d/my.cnf
RUN chmod 0444 /etc/my.cnf.d/my.cnf
RUN /etc/init.d/mariadb setup

COPY tools/setup_mariadb.sh /
RUN chmod +x setup_mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/setup_mariadb.sh"]