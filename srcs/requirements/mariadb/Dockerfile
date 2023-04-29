FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_PASSWORD
ARG MYSQL_USER
ARG MYSQL_ROOT_PASSWORD

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    mariadb-server

# Give right to mysql group on the file
# creates a directory to hold the MySQL socket file.
RUN mkdir -p /var/run/mysql

RUN chown -R mysql:mysql /var/run/mysql

RUN service mysql start \
    &&  mysql -u root -e   "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
                        ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; \
                        GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
                        FLUSH PRIVILEGES;"

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
