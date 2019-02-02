# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.box = "minimal/trusty64"
  
  config.vm.network "private_network", ip: "10.0.4.31", auto_configure: true
  config.vm.network "private_network", ip: "10.0.4.32", auto_configure: true
  config.vm.network "private_network", ip: "10.0.4.33", auto_configure: true

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = 6144
     vb.cpus = 2
  end

  config.ssh.insert_key = false

  config.vm.provision "shell", inline: "touch /opt/cassandra.sh && chmod 755 /opt/cassandra.sh"
  config.vm.provision "file", source: "./scripts/cassandra.sh", destination: "cassandra.sh"
  config.vm.provision "shell", inline: "mv cassandra.sh /opt/cassandra.sh && chmod 755 /opt/cassandra.sh"

  config.vm.provision "shell", inline: "touch /etc/init.d/cassandra && chmod 755 /etc/init.d/cassandra"
  config.vm.provision "file", source: "./scripts/cassandra.init.sh", destination: "cassandra.init.sh"
  config.vm.provision "shell", inline: "mv cassandra.init.sh /etc/init.d/cassandra && chmod 755 /etc/init.d/cassandra"

  config.vm.provision "shell", path: "./scripts/before.sh"
  config.vm.provision "shell", path: "./scripts/java.sh"
  config.vm.provision "shell", inline: "/bin/bash /opt/cassandra.sh"
  config.vm.provision "shell", path: "./scripts/redis.sh"
  config.vm.provision "shell", path: "./scripts/elasticsearch.sh"
  config.vm.provision "shell", path: "./scripts/memcached.sh"
  config.vm.provision "shell", path: "./scripts/postgresql.sh"
  config.vm.provision "shell", path: "./scripts/mysql.sh"
  config.vm.provision "shell", path: "./scripts/influxdb.sh"
  config.vm.provision "shell", path: "./scripts/after.sh"

end
