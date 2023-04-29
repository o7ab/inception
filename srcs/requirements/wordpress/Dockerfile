FROM debian:buster

RUN apt-get update && apt-get upgrade -y
	# wget \
	# curl \
	# bash \
	# php \
	# php-cgi \
	# php-mysql \
	# php-fpm \
	# php-pdo \
	# php-gd php-cli \
	# php-mbstring \
	# redis \
	# php-redis 
RUN apt-get install -y \
    curl less php
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
# RUN mkdir /run/php

#we copy the script, give the right to launch it in local on our computer
# COPY ./tools/create_wordpress.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/create_wordpress.sh
# ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

# WORKDIR /var/www/html/

EXPOSE 9000


#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
# CMD ["/usr/sbin/php-fpm7.3", "-F"]


COPY ./tools/create_wordpress.sh /tmp

RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/tmp/create_wordpress.sh"]

