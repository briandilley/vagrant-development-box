\#!/bin/bash -e

# install jdk 11 as default
sudo wget https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz -O /tmp/openjdk-11.0.1_linux-x64_bin.tar.gz
sudo tar -xvf /tmp/openjdk-11.0.1_linux-x64_bin.tar.gz -C /opt/
for i in `ls /opt/jdk-11.0.1/bin/`
do
    sudo update-alternatives --install /usr/bin/$i $i /opt/jdk-11.0.1/bin/$i 1002
    sudo update-alternatives --set $i /opt/jdk-11.0.1/bin/$i
done


# install jdk 8 as backup
sudo wget https://s3-us-west-2.amazonaws.com/blockfolio-devops/jdk-8u201-linux-x64.tar.gz -O /tmp/jdk-8u201-linux-x64.tar.gz
sudo tar -xvf /tmp/jdk-8u201-linux-x64.tar.gz -C /opt/
for i in `ls /opt/jdk1.8.0_201/bin/`
do
    sudo update-alternatives --install /usr/bin/$i $i /opt/jdk1.8.0_201/bin/$i 1002
done

# report it
echo "### JAVA VERSION:"
java -version
