FROM nginx

RUN apt-get update && \
	apt-get install openssl
RUN openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \ 
	-subj "/C=US/ST=California/L=San Francisco/O=Example Corp/CN=example.com" \
	-keyout /etc/nginx/certs/example.key \ 
	-out /etc/nginx/certs/example.crt

COPY nginx.conf /etc/nginx/conf.d/default.conf
