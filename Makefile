GREEN="\033[0;32m"
WHITE="\033[0m"

#absolute path here !!!
#/home/lcalvie/data for the 42 evaluation
DATA_DIR=${CURDIR}/data

all :
	@echo $(GREEN)Running ./srcs/docker-compose.yml$(WHITE)
	mkdir -p $(DATA_DIR)/DB
	mkdir -p $(DATA_DIR)/WordPress
	mkdir -p $(DATA_DIR)/Python
	DATA_DIR=$(DATA_DIR) docker-compose -f ./srcs/docker-compose.yml up --build 

stop:
	DATA_DIR=$(DATA_DIR) docker-compose -f ./srcs/docker-compose.yml stop

check:
	DATA_DIR=$(DATA_DIR) docker-compose -f ./srcs/docker-compose.yml ps

clean :
	@echo $(GREEN)docker stop$(WHITE)
	@echo $(GREEN)docker rm$(WHITE)
	@if [ ! -z "`docker ps -qa`" ]; then \
		docker stop $$(docker ps -qa) && \
		docker rm $$(docker ps -qa) \
		; fi
	@echo $(GREEN)docker rmi$(WHITE)
	@if [ ! -z "`docker images -qa`" ]; then \
		docker rmi -f $$(docker images -qa) 2>/dev/null || true\
		; fi
	@echo $(GREEN)docker volume rm$(WHITE)
	@if [ ! -z "`docker volume ls -q`" ]; then \
		docker volume rm $$(docker volume ls -q) \
		; fi
	@echo $(GREEN)docker network rm$(WHITE)
	@if [ ! -z "`docker network ls -q`" ]; then \
		docker network rm $$(docker network ls -q) 2>/dev/null || true \
		; fi

fclean : clean
	rm -rf $(DATA_DIR)/DB $(DATA_DIR)/WordPress $(DATA_DIR)/Python

re : fclean all

.PHONY : all clean fclean re
