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

# Bring up cluster
export TERM="dumb"
# the 10.0.2.3 really means "start the first node at 10.0.2.31"
CCM_COMMAND="JAVA_HOME=/opt/jdk1.8.0_202 ccm create vagrant -v 3.0.9 -n 3 -d -s -i 10.0.2.3 --vnodes --root"
echo Bringing up 3 node Cassandra Cluster
echo If this fails, login to the box using vagrant ssh and then execute the command: sudo $CCM_COMMAND
sudo $CCM_COMMAND
