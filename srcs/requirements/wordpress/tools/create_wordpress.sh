#!/bin/sh

# if [ -f ./wp-config.php ]
# then
# 	echo "wordpress already downloaded"
# else

# 	wget http://wordpress.org/latest.tar.gz
# 	tar xfz latest.tar.gz
# 	mv wordpress/* .
# 	rm -rf latest.tar.gz
# 	rm -rf wordpress

# 	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
# 	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
# 	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
# 	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
# 	cp wp-config-sample.php wp-config.php

# fi

# exec "$@"


cd /var/www/html/wordpress

# Download wordpress files
wp core download  --path="/var/www/html/wordpress" --allow-root


# Generate and configure the wp-config.php file
wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOSTNAME --dbprefix=wp_

# Runs the standard wordpress installation process - create the wordpress tables in db
wp core install --path="/var/www/html/wordpress" --allow-root --url=$DOMAIN --title="$WP_DB_TITLE" --admin_user=$WP_DB_ADMIN --admin_password=$WP_DB_ADMIN_PASSWORD --admin_email=$WP_DB_ADMIN_EMAIL

# Create user in wordpress
wp plugin update --allow-root --all
wp user create --path="/var/www/html/wordpress" --allow-root $WP_DB_USER $WP_DB_USER_EMAIL --user_pass=$WP_DB_USER_PASSWORD

# Activate the plugins
wp plugin update --allow-root --all

# launch php-fpm
mkdir -p /run/php/
php-fpm7.3 -F