FROM alpine:3.18

RUN apk --no-cache add nginx && apk --no-cache add openssl

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 42 -newkey rsa:2048 -keyout /etc/nginx/ssl/pnolte.42.fr.key -out /etc/nginx/ssl/pnolte.42.fr.crt -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42 Heilbronn/OU=pnolte/CN=Philipp Nolte"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]