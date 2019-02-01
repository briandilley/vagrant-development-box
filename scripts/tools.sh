#!/bin/bash -e

sudo apt-get install -y \
    python \
    python-pip \
    htop \
    wget \
    curl

sudo pip install requests awscli

echo 'datasource_list: [ None ]' | sudo -s tee /etc/cloud/cloud.cfg.d/90_dpkg.cfg
sudo apt-get purge cloud-init -y 
sudo rm -rf /etc/cloud/
sudo rm -rf /var/lib/cloud/
