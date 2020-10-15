#!/bin/bash -e

# installs Postgresql and creates a super user
# named 'develop' with the password 'develop'.
# It also creates a database named 'develop' owned
# by the 'develop' user.
sudo apt-get install -y postgresql-12 \
    postgresql-contrib \
    postgresql-12-postgis-3 \
    postgresql-12-postgis-3-scripts \
    postgresql-12-pgrouting \
    postgresql-12-pgrouting-scripts \
    postgresql-12-hll \
    postgresql-12-jsquery \
    postgresql-12-pgmemcache \
    postgresql-12-ip4r \
    postgresql-12-pgq3
sudo service postgresql restart
echo "CREATE ROLE develop SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN PASSWORD 'develop';" | sudo -u postgres psql
sudo -u postgres createdb -O develop develop

export TERM="dumb"
echo "CREATE ROLE develop SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN PASSWORD 'develop';" | sudo -u postgres psql

echo "DROP DATABASE IF EXISTS develop" | sudo -u postgres psql
echo "CREATE DATABASE develop OWNER='develop'" | sudo -u postgres psql
echo "CREATE SCHEMA IF NOT EXISTS develop AUTHORIZATION develop" | sudo -u postgres psql -d develop

echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/12/main/pg_hba.conf
echo "listen_addresses = '*'" >> /etc/postgresql/12/main/postgresql.conf
sudo service postgresql restart

sudo service postgresql stop
sudo update-rc.d postgresql disable || true
