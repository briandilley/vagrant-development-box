#!/bin/bash -e

# update package manager
#sudo add-apt-repository ppa:chris-lea/redis-server -y
#sudo apt-add-repository ppa:brightbox/ruby-ng -y
#apt-get update -y

# install and configure redis cluster
apt-get install redis-server -y
sed -i "s/# maxmemory <bytes>/maxmemory 16mb/g" /etc/redis/redis.conf
sed -i "s/# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/g" /etc/redis/redis.conf
cp /etc/redis/redis.conf /etc/redis/redis0.conf
cp /etc/redis/redis.conf /etc/redis/redis1.conf
cp /etc/redis/redis.conf /etc/redis/redis2.conf
cp /etc/init.d/redis-server /etc/init.d/redis-server0
cp /etc/init.d/redis-server /etc/init.d/redis-server1
cp /etc/init.d/redis-server /etc/init.d/redis-server2
cp /etc/default/redis-server /etc/default/redis-server0
cp /etc/default/redis-server /etc/default/redis-server1
cp /etc/default/redis-server /etc/default/redis-server2
chown redis:redis /etc/redis/redis0.conf
chown redis:redis /etc/redis/redis1.conf
chown redis:redis /etc/redis/redis2.conf
sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis/redis0.conf
sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis/redis1.conf
sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis/redis2.conf
sed -i "s/port 6379/port 6380/g" /etc/redis/redis0.conf
sed -i "s/port 6379/port 6381/g" /etc/redis/redis1.conf
sed -i "s/port 6379/port 6382/g" /etc/redis/redis2.conf
sed -i "s/# cluster-enabled yes/cluster-enabled yes/g" /etc/redis/redis0.conf
sed -i "s/# cluster-enabled yes/cluster-enabled yes/g" /etc/redis/redis1.conf
sed -i "s/# cluster-enabled yes/cluster-enabled yes/g" /etc/redis/redis2.conf
sed -i "s/# cluster-config-file nodes-6379.conf/cluster-config-file nodes-6380.conf/g" /etc/redis/redis0.conf
sed -i "s/# cluster-config-file nodes-6379.conf/cluster-config-file nodes-6381.conf/g" /etc/redis/redis1.conf
sed -i "s/# cluster-config-file nodes-6379.conf/cluster-config-file nodes-6382.conf/g" /etc/redis/redis2.conf
sed -i "s/redis-server/redis-server0/g" /etc/init.d/redis-server0
sed -i "s/\/etc\/redis\/redis.conf/\/etc\/redis\/redis0.conf/g" /etc/init.d/redis-server0
sed -i "s/\/etc\/redis\/redis.conf/\/etc\/redis\/redis0.conf/g" /etc/init.d/redis-server0
sed -i "s/redis-server/redis-server1/g" /etc/init.d/redis-server1
sed -i "s/\/etc\/redis\/redis.conf/\/etc\/redis\/redis1.conf/g" /etc/init.d/redis-server1
sed -i "s/\/etc\/redis\/redis.conf/\/etc\/redis\/redis1.conf/g" /etc/init.d/redis-server1
sed -i "s/redis-server/redis-server2/g" /etc/init.d/redis-server2
sed -i "s/\/etc\/redis\/redis.conf/\/etc\/redis\/redis2.conf/g" /etc/init.d/redis-server2
sed -i "s/\/etc\/redis\/redis.conf/\/etc\/redis\/redis2.conf/g" /etc/init.d/redis-server2
sed -i "s/DAEMON=\/usr\/bin\/redis-server.*/DAEMON=\/usr\/bin\/redis-server/g" /etc/init.d/redis-server0
sed -i "s/DAEMON=\/usr\/bin\/redis-server.*/DAEMON=\/usr\/bin\/redis-server/g" /etc/init.d/redis-server1
sed -i "s/DAEMON=\/usr\/bin\/redis-server.*/DAEMON=\/usr\/bin\/redis-server/g" /etc/init.d/redis-server2
update-rc.d redis-server0 defaults || true
update-rc.d redis-server1 defaults || true
update-rc.d redis-server2 defaults || true
update-rc.d redis-server0 enable || true
update-rc.d redis-server1 enable || true
update-rc.d redis-server2 enable || true
service redis-server0 restart
service redis-server1 restart
service redis-server2 restart

apt-get install ruby -y
gem install redis
echo "yes" | redis-cli --cluster create 127.0.0.1:6380 127.0.0.1:6381 127.0.0.1:6382


sudo service redis-server stop
sudo update-rc.d redis-server disable || true

sudo service redis-server0 stop
sudo update-rc.d redis-server0 disable || true

sudo service redis-server1 stop
sudo update-rc.d redis-server1 disable || true

sudo service redis-server2 stop
sudo update-rc.d redis-server2 disable || true
