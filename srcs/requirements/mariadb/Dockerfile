FROM alpine:3.17

# Update System and Install Tools
RUN apk update && apk upgrade && apk add --no-cache \
          mysql \
          mysql-client \
          openrc

# start openrc
RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup
RUN rc-service mariadb start
RUN rc-update add mariadb default


RUN echo "SET PASSWORD = PASSWORD('$DBWP_ROOT_PWD')" | mysql
RUN echo "DROP USER IF EXISTS ''@'localhost'" | mysql
RUN echo "DROP DATABASE IF EXISTS test" | mysql
RUN echo "CREATE USER IF NOT EXISTS '$DBWP_USER'@'localhost' IDENTIFIED BY '$DBWP_PWD'" | mysql
RUN echo "CREATE DATABASE IF NOT EXISTS $DBWP_NAME" | mysql
RUN echo "GRANT ALL PRIVILEGES ON $DBWP_NAME.* to '$DBWP_USER'@'localhost'" | mysql
RUN echo "FLUSH PRIVILEGES" | mysql

# RUN mysql -e "SET PASSWORD = PASSWORD('$DBWP_ROOT_PWD')"
# RUN mysql -e "DROP USER IF EXISTS ''@'localhost'"
# RUN mysql -e "DROP DATABASE IF EXISTS test"
# RUN mysql -e "CREATE USER IF NOT EXISTS '$DBWP_USER'@'localhost' IDENTIFIED BY '$DBWP_PWD'"
# RUN mysql -e "CREATE DATABASE IF NOT EXISTS $DBWP_NAME"
# RUN mysql -e "GRANT ALL PRIVILEGES ON $DBWP_NAME.* to '$DBWP_USER'@'localhost'"
# RUN mysql -e "FLUSH PRIVILEGES"

# COPY Files to container
#COPY conf/wordpress.sql .

# Copy installing script and make it executable
# ADD tools/run.sh .
# RUN chmod +x /run.sh

ENTRYPOINT [mysqld]