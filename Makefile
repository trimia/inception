directory = /home/mmariani

all: | $(directory)
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up

$(directory):
	@echo "Folder $(directory) does not exist"
	@cd /home/mmariani && mkdir data && cd data && mkdir wordpress mariadb && cd

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

xubuntu:
	apt-get update
	apt-get upgrade
	snap install --classic code
	apt-get install docker
	apt-get install docker-compose


dir:
		@cd /home/mmariani && mkdir data && cd data && mkdir wordpress mariadb && cd

host:
	@echo "127.0.0.1	mmariani.42.fr" >> /etc/hosts

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
	$(docker stop $(docker ps -aq))
	$(docker rm $(docker ps -aq))
	$(docker rmi -f $(docker images -q))
	@docker system prune -af

rmdir:
	rm -rf /home/mmariani/data
#remember to remove and clean network
