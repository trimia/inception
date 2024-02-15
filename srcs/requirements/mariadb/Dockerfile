FROM alpine:3.17
ARG DBWP_NAME
ARG DBWP_USER
ARG DBWP_PWD
ARG DBWP_ROOT_PWD

# Update System and Install Tools
RUN apk update && apk upgrade && apk add --no-cache \
          bash \
          mysql\
          mysql-client \
          openrc
# RUN sudo chown -R mysql:mysql /var/lib/mysql
RUN chown -R root /var/lib/mysql
RUN chmod -R 750 /var/lib/mysql
# start openrc
RUN openrc 
RUN touch /run/openrc/softlevel
# RUN openrc 

# COPY ./conf/mariadb-server.cnf /etc/my.cnf
COPY ./requirements/mariadb/conf/mariadb-server.cnf /etc/my.cnf
# RUN chmod 600 /etc/my.cnf
# COPY ./tools/init_db.sql /
COPY ./requirements/mariadb/tools/init_db.sql /
RUN sed -i "s/dbwpname/${DBWP_NAME}/g" /init_db.sql
RUN sed -i "s/dbwpuser/${DBWP_USER}/g" /init_db.sql
RUN sed -i "s/dbwppwd/${DBWP_PWD}/g" /init_db.sql
RUN sed -i "s/dbwprootpwd/${DBWP_ROOT_PWD}}}/g" /init_db.sql
RUN rc-service mariadb setup && rc-service mariadb start && mysql -sfu root < /init_db.sql
# EXPOSE 3306
# COPY ./tools/db.sh /
COPY ./requirements/mariadb/tools/db.sh /
RUN chmod +x /db.sh
# CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--socket=/var/run/mysqld/mysqld.sock", "--pid-file=/var/run/mysqld/mysqld.pid", "--port=3306"]
ENTRYPOINT ["/db.sh"]

