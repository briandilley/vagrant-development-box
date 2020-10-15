#!/bin/bash -e

# installs memcached
apt-get install memcached -y
sed -i "s/-l 127.0.0.1/-l 0.0.0.0/g" /etc/memcached.conf
service memcached restart

sudo service memcached stop
sudo update-rc.d memcached disable || true
