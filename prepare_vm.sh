#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install make curl lsb-release ca-certificates apt-transport-https software-properties-common hostsed -y
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo rm -rf /var/lib/apt/lists/*

if [ -d "/home/$USER/data" ]; then \
	echo "/home/$USER/data already exists"; else \
	mkdir /home/$USER/data; \
	echo "data directory created successfully"; \
fi

if [ -d "/home/$USER/data/wordpress" ]; then \
	echo "/home/$USER/data/wordpress already exists"; else \
	mkdir /home/$USER/data/wordpress; \
	echo "wordpress directory created successfully"; \
fi

if [ -d "/home/$USER/data/mariadb" ]; then \
	echo "/home/$USER/data/mariadb already exists"; else \
	mkdir /home/$USER/data/mariadb; \
	echo "mariadb directory created successfully"; \
fi