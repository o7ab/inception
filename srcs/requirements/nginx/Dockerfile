FROM debian:latest

RUN apt-get update && apt-get install -y nginx

RUN sed -i 's/# TLSv1.3/TLSv1.3/g' /etc/nginx/nginx.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
