all:
	if [ -d "/home/pnolte/data" ]; then \
		echo "/home/pnolte/data already exists"; else \
		sudo mkdir /home/pnolte/data; \
		echo "data directory created successfully"; \
	fi

	if [ -d "/home/pnolte/data/wordpress" ]; then \
		echo "/home/pnolte/data/wordpress already exists"; else \
		sudo mkdir /home/pnolte/data/wordpress; \
		echo "wordpress directory created successfully"; \
	fi

	if [ -d "/home/pnolte/data/mariadb" ]; then \
		echo "/home/pnolte/data/mariadb already exists"; else \
		sudo mkdir /home/pnolte/data/mariadb; \
		echo "mariadb directory created successfully"; \
	fi
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	sudo docker compose -f ./srcs/docker-compose.yml down -v

reset:
	if [ -d "/home/pnolte/data/wordpress" ]; then \
	sudo rm -rf /home/pnolte/data/wordpress && \
	echo "successfully removed all contents from /home/pnolte/data/wordpress/"; \
	fi;

	if [ -d "/home/pnolte/data/mariadb" ]; then \
	sudo rm -rf /home/pnolte//data/mariadb && \
	echo "successfully removed all contents from /home/pnolte/data/mariadb/"; \
	fi;
	
fclean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo docker system prune -a --force
	if [ -d "/home/pnolte/data/wordpress" ]; then \
	sudo rm -rf /home/pnolte/data/wordpress && \
	echo "successfully removed all contents from /home/pnolte/data/wordpress/"; \
	fi;

	if [ -d "/home/pnolte/data/mariadb" ]; then \
	sudo rm -rf /home/pnolte//data/mariadb && \
	echo "successfully removed all contents from /home/pnolte/data/mariadb/"; \
	fi;

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, clean, fclean, re, ls
