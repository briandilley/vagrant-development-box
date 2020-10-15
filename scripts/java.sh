\#!/bin/bash -e

# install jdk 11 as default
sudo apt-get install -y  openjdk-11-jdk
for i in `ls /usr/lib/jvm/java-11-openjdk-amd64/bin/`
do
    sudo update-alternatives --install /usr/bin/$i $i /usr/lib/jvm/java-11-openjdk-amd64/bin/$i 1002
    sudo update-alternatives --set $i /usr/lib/jvm/java-11-openjdk-amd64/bin/$i
done


# install jdk 8 as backup
sudo apt-get install -y openjdk-8-jdk
for i in `ls /usr/lib/jvm/java-8-openjdk-amd64/bin/`
do
    sudo update-alternatives --install /usr/bin/$i $i /usr/lib/jvm/java-8-openjdk-amd64/bin/$i 1002
done

# report it
echo "### JAVA VERSION:"
java -version
