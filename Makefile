all:
	sudo sh -c 'echo "127.0.0.1 pnolte.42.fr" >> /etc/hosts' && echo "successfully added pnolte.42.fr to /etc/hosts"
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	sudo docker compose -f ./srcs/docker-compose.yml down -v

fclean:
	sudo sh -c 'echo "127.0.0.1 pnolte.42.fr" >> /etc/hosts' && echo "successfully added pnolte.42.fr to /etc/hosts"
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo docker system prune -a
	if [ -d "/home/${USER}/data/wordpress" ]; then \
	rm -rf /home/${USER}/data/wordpress/* && \
	echo "successfully removed all contents from /home/${USER}/data/wordpress/"; \
	fi;

	if [ -d "/home/${USER}data/mariadb" ]; then \
	rm -rf /home/${USER}/data/mariadb/* && \
	echo "successfully removed all contents from /home/${USER}/data/mariadb/"; \
	fi;

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, clean, fclean, re, ls
