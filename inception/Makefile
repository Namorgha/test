.PHONY : clean all fclean re

all:
	sh /root/inception/srcs/requirements/tools/script.sh
	@mkdir -p /home/${USER}/data/mariadb
	@mkdir -p /home/${USER}/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker compose -f ./srcs/docker-compose.yml down
fclean:
	@docker compose -f ./srcs/docker-compose.yml down -v --rmi all
re: fclean all
