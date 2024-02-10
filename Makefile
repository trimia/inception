

nginx:
	@docker build srcs/requirements/nginx -t nginx
	@docker run -p 443:443 --privileged nginx

wp:
	@docker build srcs/requirements/wordpress/ -t wordpress
# @docker run -it --name wordpress -p 9000:9000 --privileged --env-file=./srcs/.env wordpress --link mariadb
	@docker run -it -p 9000:9000 --privileged  wordpress

db:
	@docker build srcs/requirements/mariadb/ -t mariadb
	@docker run -it --name mariadb -p 3306:3306 --privileged  mariadb 
# @docker run -it -p 3306:3306 --env-file=/../../.env mariadb

dir:
	cd ~/Desktop && mkdir vol && cd vol && mkdir data && cd data && mkdir wordpress mariadb && cd

comp:dir
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up
#	docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env build
#	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d mariadb

# Wait for mariadbinc to be healthy
#	 docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env run --rm wait-mariadb

# Build and start the wordpressinc service
#	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d wordpress
prune:
	docker-compose -f ./srcs/docker-compose.yml down --volumes
	docker network prune -f
# $(docker stop $(docker ps -aq))
# $(docker rm $(docker ps -aq))
#$(docker rmi -f $(docker images -q))
	rm -rf ~/Desktop/vol
#remember to remove and clean network
	@docker system prune -af