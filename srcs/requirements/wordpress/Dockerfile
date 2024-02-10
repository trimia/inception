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
          php82-mbstring \
          php82-tokenizer \
          php82-phar \
          php82-cli \
          php82-fpm \
          php82-mysqli \
          php82-gd \
          php82-cgi \
          mysql-client \
          curl \
          bash \
          openrc && openrc && touch /run/openrc/softlevel

# RUN apk add php82-common php82-iconv php82-json php82-gd php82-curl php82-xml \
# 	php82-mysqli php82-imap php82-cgi fcgi php82-pdo php82-pdo_mysql php82-soap php82-xmlrpc \
# 	php82-posix php82-mcrypt php82-gettext php82-ldap php82-ctype php82-dom php82 php82-fpm php82-opcache

# RUN mkdir -p /var/www/html


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp-cli
RUN mkdir -p /var/www/html
RUN chown -R root /var/www/html
# RUN chown -R root /var/www/html \
# 	&& chmod -R 775 /var/www/html
RUN mkdir -p /run/php82 && chown root /run/php82
# RUN mkdir -p /run/php82 /sys/fs/cgroup/openrc.fsck /sys/fs/cgroup/openrc.root /sys/fs/cgroup/openrc.localmount /sys/fs/cgroup/openrc.hostname
# RUN chmod -R 1777 /run /sys/fs/cgroup/openrc.fsck /sys/fs/cgroup/openrc.root /sys/fs/cgroup/openrc.localmount /sys/fs/cgroup/openrc.hostname

# RUN mkdir -p /run/php82 && chown -R root /run/php82
# RUN touch /run/php/php8.2-fpm.pid
RUN sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php82/php-fpm.d/www.conf
# RUN sed -i "s/nobody/root/g" /etc/php82/php-fpm.d/www.conf
WORKDIR /var/www/html
RUN wp-cli core download --allow-root
# RUN rc-service php-fpm82 start
# RUN wp-cli core download --allow-root \
#     && wp-cli config create --dbname=$DBWP_NAME --dbuser=$DBWP_USER --dbpass=$DBWP_PWD --dbhost=$DATABASE_HOST --allow-root
# COPY ./tools/init_wp.sh /var/www/html/init_wp.sh
COPY ./requirements/wordpress/tools/init_wp.sh /var/www/html/init_wp.sh
RUN chmod +x init_wp.sh


# RUN wp-cli core download --allow-root && wp-cli config create --dbname=dbwp --dbuser=user --dbpass=secret --dbhost=mariadbinc --allow-root
# COPY ./conf/wp-config.php /var/www/html/wp-config.php
# COPY ./requirements/wordpress/conf/wp-config.php /var/www/html/wp-config.php

# RUN sed -i "s/database_name_here/${DBWP_NAME}/g" /var/www/html/wp-config.php
# RUN sed -i "s/username_here/${DBWP_USER}/g" /var/www/html/wp-config.php
# RUN sed -i "s/password_here/${DBWP_PWD}/g" /var/www/html/wp-config.php
# RUN sed -i "s/localhost/${DATABASE_HOST}/g" /var/www/html/wp-config.php
# RUN wp-cli core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
# # # RUN wp-cli config create --dbname=$DBWP_NAME --dbuser=$DBWP_USER --dbpass=$DBWP_PWD --dbhost=127.0.0.1 --allow-root
# RUN wp-cli user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
# RUN wp-cli theme install astra --activate --allow-root
# EXPOSE 9000
# ENTRYPOINT ["/usr/sbin/php-fpm82","-F"]
CMD ["/var/www/html/init_wp.sh"]

