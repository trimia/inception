#!/bin/bash
rc-service mariadb setup && rc-service mariadb start && mysql -sfu root < /init_db.sql

kill $(cat /var/run/mysqld/mariadb.pid)
# rc-service mariadb restart
mysqld
# mysqld_safe --datadir="/var/lib/mysql"