#!/bin/bash -e

set -o errexit

if [ -d /root/.ccm/vagrant ]; then
    rm -rf /root/.ccm/vagrant
fi

# Retrieve the version variables from the provisioning arguments
CCM_VERSION=${1:-master}
echo CCM [${CCM_VERSION}]

#Install package updates
echo Installing System Packages ...
sudo apt-get install -y -qq software-properties-common

# Install the packages
echo Installing other packages ...
sudo apt-get install -y -qq openjdk-8-jdk ant git libxml2-dev libxslt1-dev libyaml-dev maven \
                    python3 python3-dev python3-pip vim-gtk \
                    zlib1g-dev

# Upgrade pip
echo Upgrading pip ...
sudo pip3 install --upgrade pip

# Install CCM and its dependencies
echo Installing CCM ...
sudo pip3 install git+https://github.com/riptano/ccm.git@${CCM_VERSION}

sudo update-rc.d cassandra defaults || true
sudo service cassandra start
sudo service cassandra stop
sudo update-rc.d cassandra disable || true
