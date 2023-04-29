FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    curl less php sendmail
RUN 	apt-get install -y php-fpm
RUN		apt-get install -y php-mysql \
    &&		apt-get install -y php-mysqli
RUN apt-get install -y mariadb-client

RUN apt-get update && apt-get upgrade -y
#to install wp_cli command and put it in the right directory /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html/wordpress


EXPOSE 9000

COPY ./tools/create_wordpress.sh /tmp

WORKDIR /var/www/html/wordpress

RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/tmp/create_wordpress.sh"]

