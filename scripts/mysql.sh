#!/bin/bash -e

set -o nounset
set -o errexit

# trusty uses MySQL 5.5
DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/g" /etc/mysql/my.cnf
service mysql restart

cat <<EOF | mysql
CREATE DATABASE develop;
CREATE USER 'develop'@'localhost' IDENTIFIED BY 'develop';
GRANT ALL PRIVILEGES ON * . * TO 'develop'@'localhost' WITH GRANT OPTION;
CREATE USER 'develop'@'%' IDENTIFIED BY 'develop';
GRANT ALL PRIVILEGES ON * . * TO 'develop'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

sudo service mysql stop
sudo update-rc.d mysql disable
