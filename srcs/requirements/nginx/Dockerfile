FROM alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl \
        curl \
        vim \
        openrc && \
    openrc && touch /run/openrc/softlevel

# nginx SSL
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/mmariani.crt \
        -keyout /etc/nginx/ssl/mmariani.key \
        -subj "/C=IT/ST=Rome/L=Rome/O=42 School/OU=mmariani/CN=mmariani/"

#simple index page
# RUN mkdir -p /var/www/html
# RUN chown -R nginx:nginx /var/www/html
# COPY ./tools/index.html /www/index.html

# nginx config
RUN mkdir -p /run/nginx
RUN chown -R nginx:nginx /run/nginx/ && chmod 775 /run/nginx/
#RUN rm -f /etc/nginx/nginx.conf
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/nginx.conf
# RUN rc-service nginx restart
# EXPOSE 433
# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]

