#!/bin/bash -e

# prepare the repo
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
#source /etc/lsb-release
#echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
echo "deb https://repos.influxdata.com/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

# install it
sudo apt-get update && sudo apt-get install -y influxdb chronograf telegraf

sudo service influxdb stop
sudo service chronograf stop
sudo service telegraf stop

sudo sed -i "s/# reporting-disabled = false/reporting-disabled = true/g" /etc/influxdb/influxdb.conf
sudo sed -i "s/# bind-address = \"127.0.0.1:8088\"/bind-address = \"0.0.0.0:8088\"/g" /etc/influxdb/influxdb.conf
sudo sed -i "s/# bind-address = \":8086\"/bind-address = \"0.0.0.0:8086\"/g" /etc/influxdb/influxdb.conf
sudo sed -i "s/# bind-address = \":8082\"/bind-address = \"0.0.0.0:8082\"/g" /etc/influxdb/influxdb.conf
sudo sed -i "s/# bind-address = \":8089\"/bind-address = \"0.0.0.0:8089\"/g" /etc/influxdb/influxdb.conf
sudo sed -i "s/# index-version = \"inmem\"/index-version = \"tsi1\"/g" /etc/influxdb/influxdb.conf

sudo sed -i "s/# urls = \[\"http:\/\/127.0.0.1:8086\"\]/urls = \[\"http:\/\/127.0.0.1:8086\"\]/g" /etc/telegraf/telegraf.conf

echo "PORT=9888" | sudo tee -a /etc/default/chronograf
echo "INFLUXDB_URL=http://0.0.0.0:8086" | sudo tee -a /etc/default/chronograf


sudo service influxdb stop
sudo update-rc.d influxdb disable || true

sudo service chronograf stop
sudo update-rc.d chronograf disable || true

sudo service telegraf stop
sudo update-rc.d telegraf disable || true
