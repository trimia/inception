FROM alpine:3.17

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN apk update && apk upgrade && apk add --no-cache \
          php82 \
          fcgi \
          php82-cgi \
          wget \
          mysql \
          mysql-client \
          php82-mysqli \
          php-fpm \
          php-phar \
          php-cli \
          curl \
          bash \
          openrc
          #php-mysql

# COPY .env .
# RUN export $(grep -v '^#' .env | xargs)


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp-cli
RUN wp-cli core download --allow-root --path=/wp
# COPY ./conf/wp-config.php /wp/wp-config.php
# RUN openrc
# RUN touch /run/openrc/softlevel
# CMD ["/bin/bash" ,"-c", "/etc/init.d/mariadb setup"]
# CMD ["/bin/bash" ,"-c", "rc-service mariadb start"]
# # CMD ["/etc/init.d/mariadb", "setup"]

# RUN eval "/etc/init.d/mariadb setup"
# RUN eval "rc-service mariadb start"
# RUN rc-update add mariadb default

# RUN eval "mysql -sfu <<EOF
# SET PASSWORD = PASSWORD('$DBWP_ROOT_PWD')
# DROP USER IF EXISTS ''@'localhost'
# DROP DATABASE IF EXISTS test
# CREATE USER IF NOT EXISTS '$DBWP_USER'@'localhost' IDENTIFIED BY '$DBWP_PWD'
# CREATE DATABASE IF NOT EXISTS $DBWP_NAME
# GRANT ALL PRIVILEGES ON $DBWP_NAME.* to '$DBWP_USER'@'localhost'
# FLUSH PRIVILEGES
# EOF"
# RUN mysql -e "SET PASSWORD = PASSWORD('$DBWP_ROOT_PWD')"
# #RUN mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DBWP_ROOT_PWD'"
# RUN mysql -e "DROP USER IF EXISTS ''@'localhost'"
# RUN mysql -e "DROP DATABASE IF EXISTS test"
# RUN mysql -e "CREATE USER IF NOT EXISTS '$DBWP_USER'@'localhost' IDENTIFIED BY '$DBWP_PWD'"
# RUN mysql -e "CREATE DATABASE IF NOT EXISTS $DBWP_NAME"
# RUN mysql -e "GRANT ALL PRIVILEGES ON $DBWP_NAME.* to '$DBWP_USER'@'localhost'"
# RUN mysql -e "FLUSH PRIVILEGES"


WORKDIR /wp
RUN wp-cli config create --dbname=$DBWP_NAME --dbuser=$DBWP_USER --dbpass=$DBWP_PWD --dbhost=$DATABASE_HOST --allow-root
RUN wp-cli core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
RUN wp-cli user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
RUN wp-cli theme install astra --activate --allow-root


