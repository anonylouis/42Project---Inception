RED="\033[0;31m"
WHITE="\033[0m"


all :
	@echo $(RED)Running ./srcs/docker-compose.yml$(WHITE)
	mkdir -p /home/lcalvie/data/DB
	mkdir -p /home/lcalvie/data/WordPress
	sudo docker-compose -f ./srcs/docker-compose.yml up --build 

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml stop

check:
	sudo docker-compose -f ./srcs/docker-compose.yml ps

clean :
	@echo $(RED)docker stop$(WHITE)
	@echo $(RED)docker rm$(WHITE)
	@if [ ! -z "`sudo docker ps -qa`" ]; then \
		sudo docker stop $$(sudo docker ps -qa) && \
		sudo docker rm $$(sudo docker ps -qa) \
		; fi
	@echo $(RED)docker rmi$(WHITE)
	@if [ ! -z "`sudo docker images -qa`" ]; then \
		sudo docker rmi -f $$(sudo docker images -qa) 2>/dev/null || true\
		; fi
	@echo $(RED)docker volume rm$(WHITE)
	@if [ ! -z "`sudo docker volume ls -q`" ]; then \
		sudo docker volume rm $$(sudo docker volume ls -q) \
		; fi
	@echo $(RED)docker network rm$(WHITE)
	@if [ ! -z "`sudo docker network ls -q`" ]; then \
		sudo docker network rm $$(sudo docker network ls -q) 2>/dev/null || true \
		; fi

fclean : clean
	sudo rm -rf /home/lcalvie/data/DB /home/lcalvie/data/WordPress

re : fclean all

.PHONY : all clean fclean re
