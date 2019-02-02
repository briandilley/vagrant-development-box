#!/bin/bash -e

sudo apt-get update -y

sudo apt-get install -y \
    python \
    python-pip \
    htop \
    wget \
    curl \
    software-properties-common \
    python-software-properties \
    apt-transport-https

sudo pip install requests awscli
