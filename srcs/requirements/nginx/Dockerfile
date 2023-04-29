FROM	debian:buster

RUN		apt-get update && apt-get upgrade
RUN		apt-get install -y nginx \
                openssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/ssl/oabushar.crt \
       -keyout /etc/ssl/oabushar.key \
       -subj "/C=EN/ST=AbuDhabi/L=AbuDhabi/O=42 School/OU=oabushar/CN=oabushar/"

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.2 TLSv1.3;/' /etc/nginx/sites-enabled/nginx.conf


EXPOSE	443

RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["nginx", "-g", "daemon off;"]

