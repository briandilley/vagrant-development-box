#!/bin/bash -e

LAUNCH_KIBANA=$1

# update package manager
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get update -y

# install it
sudo apt-get install -y elasticsearch kibana

sudo /etc/init.d/elasticsearch stop
sudo /etc/init.d/kibana stop


echo "network.host: 0.0.0.0" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
cat /etc/elasticsearch/elasticsearch.yml

cp /etc/elasticsearch/jvm.options /etc/elasticsearch/jvm.options.old
cat /etc/elasticsearch/jvm.options  | grep -v "\-Xms1g" | grep -v "\-Xmx1g" > /tmp/jvm.options
echo "-Xms512m" >> /tmp/jvm.options
echo "-Xmx512m" >> /tmp/jvm.options
cat /tmp/jvm.options > /etc/elasticsearch/jvm.options
cat /etc/elasticsearch/jvm.options

echo "server.host: 0.0.0.0" | sudo tee -a /etc/kibana/kibana.yml
echo "elasticsearch.url: \"http://localhost:9200\"" | sudo tee -a /etc/kibana/kibana.yml
cat /etc/kibana/kibana.yml

sudo service elasticsearch stop
sudo service kibana stop
sudo update-rc.d elasticsearch disable || true
sudo update-rc.d kibana disable || true
