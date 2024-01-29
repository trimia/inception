#!/bin/bash

kill $(cat /var/run/mysqld/mariadb.pid)
# rc-service mariadb restart
mysqld
# mysqld_safe --datadir="/var/lib/mysql"