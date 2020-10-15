#!/bin/bash -e

sudo apt-get update -y

sudo apt-get install -y \
    python3 \
    python3-pip \
    htop \
    wget \
    curl \
    software-properties-common \
    apt-transport-https

sudo pip3 install requests awscli
