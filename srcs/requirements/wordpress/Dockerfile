FROM alpine:3.17

ARG DBWP_NAME
ARG DBWP_USER
ARG DBWP_PWD
ARG DATABASE_HOST
ARG DOMAIN_NAME
ARG WP_TITLE
ARG WP_ADMIN_USR
ARG WP_ADMIN_PWD
ARG WP_ADMIN_EMAIL
ARG WP_USR
ARG WP_EMAIL
ARG WP_PWD

# VOLUME [ "/var/www/html" ]
# RUN chown -R /var/www/html
# RUN chown -R root /var/www/html \
# 	&& chmod -R 775 /var/www/html
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN apk update && apk upgrade && apk add --no-cache \
          php82 \
          fcgi \
          php82-cgi \
          php82-mysqli \
          php82-mbstring \
          php82-fpm \
          php82-phar \
          php82-cli \
          mysql-client \
          curl \
          openrc && openrc && touch /run/openrc/softlevel
          # bash \


# RUN mkdir -p /var/www/html


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp-cli
RUN mkdir -p /var/www/html
RUN chown -R root /var/www/html
RUN chown -R root /var/www/html \
	&& chmod -R 775 /var/www/html
RUN mkdir -p /run/php82
# RUN touch /run/php/php8.2-fpm.pid
RUN sed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g" /etc/php82/php-fpm.d/www.conf
WORKDIR /var/www/html
# RUN rc-service php-fpm82 start
# # RUN wp-cli core download --allow-root
# RUN wp-cli core download --allow-root \
#     && wp-cli config create --dbname=$DBWP_NAME --dbuser=$DBWP_USER --dbpass=$DBWP_PWD --dbhost=mariadbinc:3306 --allow-root




# # RUN wp-cli core download --allow-root && wp-cli config create --dbname=dbwp --dbuser=user --dbpass=secret --dbhost=mariadbinc --allow-root
# # COPY ./conf/wp-config.php /var/www/html/wp-config.php
# # COPY ./requirements/wordpress/conf/wp-config.php /var/www/html/wp-config.php

# # RUN sed -i "s/database_name_here/${DBWP_NAME}/g" /var/www/html/wp-config.php
# # RUN sed -i "s/username_here/${DBWP_USER}/g" /var/www/html/wp-config.php
# # RUN sed -i "s/password_here/${DBWP_PWD}/g" /var/www/html/wp-config.php
# # RUN sed -i "s/localhost/${DATABASE_HOST}/g" /var/www/html/wp-config.php
# RUN wp-cli core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
# # # RUN wp-cli config create --dbname=$DBWP_NAME --dbuser=$DBWP_USER --dbpass=$DBWP_PWD --dbhost=127.0.0.1 --allow-root
# RUN wp-cli user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
# RUN wp-cli theme install astra --activate --allow-root
# EXPOSE 9000
# ENTRYPOINT ["/usr/sbin/php-fpm82","-F"]

