FROM alpine:3.18.4

RUN apk --no-cache add nginx && apk --no-cache add openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/cert.key -out /etc/ssl/cert.pem -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42 Heilbronn/OU=pnolte/CN=Philipp Nolte"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]