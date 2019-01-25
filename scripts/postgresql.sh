#!/bin/bash -e

# update package manager
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
apt-get update -y

# installs Postgresql and creates a super user
# named 'develop' with the password 'develop'.
# It also creates a database named 'develop' owned
# by the 'develop' user.
apt-get install postgresql-9.6 postgresql-contrib-9.6 -y
service postgresql restart
echo "CREATE ROLE develop SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN PASSWORD 'develop';" | sudo -u postgres psql
sudo -u postgres createdb -O develop develop

export TERM="dumb"
echo "CREATE ROLE develop SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN PASSWORD 'develop';" | sudo -u postgres psql

echo "DROP DATABASE IF EXISTS develop" | sudo -u postgres psql
echo "CREATE DATABASE develop OWNER='develop'" | sudo -u postgres psql
echo "CREATE SCHEMA IF NOT EXISTS develop AUTHORIZATION develop" | sudo -u postgres psql -d develop

echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/9.6/main/pg_hba.conf
echo "listen_addresses = '*'" >> /etc/postgresql/9.6/main/postgresql.conf
service postgresql restart

sudo service postgresql stop
sudo update-rc.d postgresql disable
