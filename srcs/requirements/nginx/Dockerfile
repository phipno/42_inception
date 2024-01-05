FROM alpine:3.18

RUN apk --no-cache add nginx && apk --no-cache add openssl


RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 42 -newkey rsa:2048 -keyout /etc/ssl/guguKuku.key -out /etc/ssl/camaChameleon.csr -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42 Heilbronn/OU=pnolte/CN=Philipp Nolte"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod +x /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]