

nginx:
	@docker build srcs/requirements/nginx -t nginx
	@docker run -p 443:443 --privileged nginx

wp:
	@docker build srcs/requirements/wordpress/ -t wordpress
#	@docker run -it -p 9000:9000 --privileged  wordpress
	@docker run -it -p 9000:9000 --privileged --env-file=.env wordpress
#@docker run -it -p 9000:9000 --privileged  wordpress

db:
	@docker build srcs/requirements/mariadb/ -t mariadb
#	@docker run -it -p 9000:9000 --privileged  wordpress
	@docker run -it -p 9000:9000 --privileged --env-file=.env mariadb
#@docker run -it -p 9000:9000 --privileged  wordpress

#@docker run -p 9000:9000 --privileged wordpress
prune:
	@docker system prune -af 
