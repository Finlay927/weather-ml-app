#! /bin/bash
sudo groupadd docker
sudo usermod -aG docker $USER
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
