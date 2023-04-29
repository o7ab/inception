all :
	sudo mkdir -p /Users/oabushar/data/wp
	sudo mkdir -p /Users/oabushar/data/sql
	sudo docker-compose -f ./srcs/requirements/docker-compose.yml up --build
build :
	sudo docker-compose -f ./srcs/requirements/docker-compose.yml build
down :
	sudo docker-compose -f ./srcs/requirements/docker-compose.yml down
clean :
	sudo docker-compose -f ./srcs/requirements/docker-compose.yml down
	sudo rm -rf /Users/oabushar/data/wp
	sudo rm -rf /Users/oabushar/data/sql
	sudo docker system prune -f -a

.PHONY: all down clean