#!/bin/bash -e

sudo apt-get update -y

sudo apt-get install -y \
    python \
    python-pip \
    htop \
    wget \
    curl

sudo pip install requests awscli
