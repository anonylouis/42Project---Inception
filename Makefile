GREEN="\033[0;32m"
WHITE="\033[0m"

#absolute path here !!!
#/home/login/data for the 42 evaluation
DATA_DIR=${CURDIR}/data

all :
	@echo $(GREEN)Running ./srcs/docker-compose.yml$(WHITE)
	mkdir -p $(DATA_DIR)/DB
	mkdir -p $(DATA_DIR)/WordPress
	mkdir -p $(DATA_DIR)/Python
	@DATA_DIR=$(DATA_DIR) docker-compose -f ./srcs/docker-compose.yml up --build -d
	sleep 70
	@echo $(GREEN)Dockers are ready !$(WHITE)

stop:
	@DATA_DIR=$(DATA_DIR) docker-compose -f ./srcs/docker-compose.yml stop

check:
	@DATA_DIR=$(DATA_DIR) docker-compose -f ./srcs/docker-compose.yml ps

clean :
	@echo $(GREEN)docker stop$(WHITE)
	@docker stop nginx mariadb wordpress ftp website python adminer redis 2>/dev/null || true
	@echo $(GREEN)docker rm$(WHITE)
	@docker rm nginx mariadb wordpress ftp website python adminer redis 2>/dev/null || true
	@echo $(GREEN)docker rmi$(WHITE)
	@docker rmi srcs-nginx:latest srcs-mariadb:latest srcs-wordpress:latest srcs-ftp:latest srcs-website:latest srcs-python:latest srcs-adminer:latest srcs-redis:latest 2>/dev/null || true
	@echo $(GREEN)docker volume rm$(WHITE)
	@docker volume rm srcs_Python srcs_WordPress srcs_DB 2>/dev/null || true
	@echo $(GREEN)docker network rm$(WHITE)
	@docker network rm srcs_inception 2>/dev/null || true

fclean : clean
	rm -rf $(DATA_DIR)/DB $(DATA_DIR)/WordPress $(DATA_DIR)/Python

re : fclean all

.PHONY : all clean fclean re
