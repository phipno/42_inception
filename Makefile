DATA_DIR = ~/data

start: $(DATA_DIR)
#	docker-compose -f ./srcs/docker-compose.yml build --no-cache
	docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	docker compose -f ./srcs/docker-compose.yml down

$(DATA_DIR):
	mkdir -p ~/data
	mkdir -p ~/data/www
	mkdir -p ~/data/db