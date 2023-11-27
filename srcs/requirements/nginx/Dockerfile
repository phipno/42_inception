FROM alpine:3.18.4

RUN apk --no-cache add nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /path/to/ssl/cert.key -out /path/to/
RUN mkdir -p /etc/nginx/ssl

ENTRYPOINT [ "./run.sh" ]