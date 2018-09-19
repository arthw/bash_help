#!/bin/bash

# Drafted by Jianyu Zhang
# zhang.jianyu@outlook.com
# Please enjoy it freely

sudo apt-get update

sudo apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce

sudo groupadd -f docker
sudo usermod -aG docker $USER

sudo echo "{
  \"ipv6\": true,
  \"fixed-cidr-v6\": \"2001::1/64\",
  \"live-restore\": true,
  \"insecure-registries\" : [ \"10.124.100.184:5000\" ]
}" > /etc/docker/daemon.json

sudo echo "DOCKER_OPTS=\"--dns 64.104.123.144 --dns 8.8.8.8 --dns 8.8.4.4\"
export no_proxy=localhost,127.0.0.1,10.124.100.184,\$no_proxy
export http_proxy=http://proxy.esl.cisco.com:8080
export https_proxy=http://proxy.esl.cisco.com:8080" >> /etc/default/docker

sudo service docker restart

sudo docker run hello-world

#need to reboot to enable the user group add.
#sudo reboot
