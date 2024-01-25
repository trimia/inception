FROM alpine:3.17
ARG DBWP_NAME
ARG DBWP_USER
ARG DBWP_PWD
ARG DBWP_ROOT_PWD

# Update System and Install Tools
RUN apk update && apk upgrade && apk add --no-cache \
          bash \
          mariadb \
          mysql-client \
          mysql \
          openrc
COPY ./requirements/mariadb/conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
# COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
# RUN chmod 600 /etc/my.cnf.d/mariadb-server.cnf
RUN mkdir -p /run/mysqld/
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /var/run/mysqld

# start openrc
RUN openrc 
RUN touch /run/openrc/softlevel
# RUN chmod 600 /etc/my.cnf.d/mariadb-server.cnf
# RUN /etc/init.d/mariadb setup
RUN mkdir -p /auth_pam_tool_dir && chown -R mysql:mysql /auth_pam_tool_dir \
    && chmod 700 /auth_pam_tool_dir \
    && chmod 644 /etc/my.cnf.d/mariadb-server.cnf \
    && chown root:root /etc/my.cnf.d/mariadb-server.cnf
RUN /etc/init.d/mariadb setup && rc-service mariadb start && mysql -e "USE mysql; FLUSH PRIVILEGES; CREATE USER IF NOT EXISTS '$DBWP_USER'@'localhost' IDENTIFIED BY '$DBWP_PWD'; CREATE DATABASE IF NOT EXISTS $DBWP_NAME; GRANT ALL PRIVILEGES ON $DBWP_NAME.* TO '$DBWP_USER'@'localhost' IDENTIFIED BY '$DBWP_PWD'; FLUSH PRIVILEGES; ALTER USER 'root'@'localhost' IDENTIFIED BY '$DBWP_ROOT_PWD';"
# RUN /etc/init.d/mariadb setup && rc-service mariadb start && mysql -e "USE mysql; FLUSH PRIVILEGES; CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'secret'; CREATE DATABASE IF NOT EXISTS wpdb; GRANT ALL PRIVILEGES ON wpdb.* TO 'user'@'localhost' IDENTIFIED BY 'secret'; ALTER USER 'root'@'localhost' IDENTIFIED BY 'Secret1!'; FLUSH PRIVILEGES;"
# RUN rc-service mariadb restart
# COPY tools/db.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/db.sh
# ENTRYPOINT [ "/usr/local/bin/db.sh" ]
# RUN etc/init.d/mariadb setup && rc-service mariadb start
#  \
#     && mysqld --user=mysql --bootstrap --verbose=0 < /dev/null \
#     && mysql -u root -e "CREATE DATABASE mydatabase;" \
#     && mysql -u root -e "CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';" \
#     && mysql -u root -e "GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'localhost';" \
#     && mysql -u root -e "FLUSH PRIVILEGES;" \
#     && mysqladmin -u root password 'newrootpassword' \
#     && pkill mysqld


# RUN rc-service mariadb restart

# RUN mariadb-install-db --user=root --ldata=/var/lib/mysql && \
#       mysql -e "CREATE DATABASE IF NOT EXISTS $DBWP_NAME;" && \
#       mysql -e "CREATE USER IF NOT EXISTS '$DBWP_USER'@'%' IDENTIFIED BY '$DBWP_PWD';" && \
#       mysql -e "GRANT ALL PRIVILEGES ON $DBWP_NAME.* to '$DBWP_USER'@'%';" && \
#       mysql -e "FLUSH PRIVILEGES;" && \
#       mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';"
# RUN rc-service mariadb restart && rc-update add mariadb default


# RUN chmod 600 /etc/my.cnf.d/mariadb-server.cnf && /etc/init.d/mariadb setup && rc-service mariadb start && mysql < /temp/init_db.sql

# RUN chmod 600 /etc/my.cnf.d/mariadb-server.cnf && /etc/init.d/mariadb setup && rc-service mariadb start && echo "USE mysql;" | mysql && echo "CREATE DATABASE IF NOT EXISTS wpdb;" | mysql && echo "CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'secret';" | mysql && echo "GRANT ALL PRIVILEGES ON wpdb.* to 'user'@'localhost' IDENTIFIED BY 'secret';" | mysql && echo "FLUSH PRIVILEGES;" | mysql && echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';" | mysql
# RUN chmod 600 /etc/my.cnf.d/mariadb-server.cnf && /etc/init.d/mariadb setup && rc-service mariadb start && echo "USE mysql;" | mysql && echo "CREATE DATABASE IF NOT EXISTS $DBWP_NAME;" | mysql && echo "CREATE USER IF NOT EXISTS '$DBWP_USER'@'localhost' IDENTIFIED BY '$DBWP_PWD';" | mysql && echo "GRANT ALL PRIVILEGES ON $DBWP_NAME.* TO '$DBWP_USER'@'localhost' IDENTIFIED BY '$DBWP_PWD';" | mysql && echo "FLUSH PRIVILEGES;" | mysql && echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DBWP_ROOT_PWD';" | mysql



# RUN rc-update add mariadb default
# CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--socket=/var/run/mysqld/mysqld.sock", "--pid-file=/var/run/mysqld/mysqld.pid", "--port=3306"]

# CMD ["mysqld", "--user=${DBWP_USER}","--console"]
# CMD ["mysqld", "--user=mysql"  ,"--console"]

# ENTRYPOINT ["/usr/bin/mysqld_safe", "--console"]
EXPOSE 3306
ENTRYPOINT ["mysqld"]


# RUN /etc/init.d/mysql start && \
#          mysql -u root -p$DBWP_ROOT_PWD  -e "GRANT ALL PRIVILEGES ON *.* TO '$DBWP_user'@'%' IDENTIFIED BY '$DBWP_PWD';FLUSH PRIVILEGES;" && \
#         mysql -u root -p${MYSQL_ROOT_PASSWORD}  < /tmp/dump.sql

