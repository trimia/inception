#!/bin/bash
# mkdir -p /run/php82 /sys/fs/cgroup/openrc.fsck /sys/fs/cgroup/openrc.root /sys/fs/cgroup/openrc.localmount /sys/fs/cgroup/openrc.hostname
# chmod -R 1777 /run /sys/fs/cgroup/openrc.fsck /sys/fs/cgroup/openrc.root /sys/fs/cgroup/openrc.localmount /sys/fs/cgroup/openrc.hostname

# rc-service php-fpm82 start

# Wait for PHP-FPM to be ready
# until [ -e /run/php82/php-fpm.sock ]; do
#     sleep 1
# done

# cd /var/www/html/
# wp-cli config create --dbname=${DBWP_NAME} --dbuser=${DBWP_USER} --dbpass=${DBWP_PWD} --dbhost=${DATABASE_HOST} --dbcharset="utf8" --config-file="/var/www/html/wp-config.php" --allow-root && echo "wpdb created"
# wp-cli core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
# wp-cli user create ${WP_USR} ${WP_EMAIL} --role=author --user_pass=${WP_PWD} --allow-root

# # rc-service php-fpm82 stop
# /usr/sbin/php-fpm82 -FR


cd /var/www/html/
wp-cli config create --dbname=${DBWP_NAME} --dbuser=${DBWP_USER} --dbpass=${DBWP_PWD} --dbhost=${DATABASE_HOST} --dbcharset="utf8" --config-file="/var/www/html/wp-config.php" --allow-root && echo "wpdb created"
wp-cli core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
# wp-cli config set WP_HOME "http://localhost:9000"
# wp-cli config set WP_SITEURL "http://localhost:9000"
wp-cli user create ${WP_USR} ${WP_EMAIL} --role=author --user_pass=${WP_PWD} --allow-root
wp-cli theme install astra --activate --allow-root
wp-cli import inception.WordPress.2024-02-10.xml --authors=create
/usr/sbin/php-fpm82 -F


