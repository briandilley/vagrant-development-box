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
sudo apt-get install -y -qq python-software-properties

# Install the packages
echo Installing other packages ...
sudo apt-get install -y -qq ant git libxml2-dev libxslt1-dev libyaml-dev maven \
                    python2.7-dev python-pip vim-gtk \
                    zlib1g-dev

# Upgrade pip
echo Upgrading pip ...
sudo pip install --upgrade pip

# Install CCM and its dependencies
echo Installing CCM ...
sudo pip install git+https://github.com/pcmanus/ccm.git@${CCM_VERSION}

sudo update-rc.d cassandra defaults
sudo service cassandra start
sudo service cassandra stop
sudo update-rc.d cassandra disable
