# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "10.0.2.31"
  config.vm.network "private_network", ip: "10.0.2.32"
  config.vm.network "private_network", ip: "10.0.2.33"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = 6144
     vb.cpus = 2
  end

  config.vm.provision "shell", inline: "touch /opt/cassandra.sh && chmod 755 /opt/cassandra.sh"
  config.vm.provision "file", source: "./scripts/cassandra.sh", destination: "cassandra.sh"
  config.vm.provision "shell", inline: "mv cassandra.sh /opt/cassandra.sh && chmod 755 /opt/cassandra.sh"

  config.vm.provision "shell", inline: "touch /etc/init.d/cassandra && chmod 755 /etc/init.d/cassandra"
  config.vm.provision "file", source: "./scripts/cassandra.init.sh", destination: "cassandra.init.sh"
  config.vm.provision "shell", inline: "mv cassandra.init.sh /etc/init.d/cassandra && chmod 755 /etc/init.d/cassandra"

  config.vm.provision "shell", inline: "apt-get update -y"
  config.vm.provision "shell", path: "./scripts/tools.sh"
  config.vm.provision "shell", path: "./scripts/java.sh"
  config.vm.provision "shell", inline: "/bin/bash /opt/cassandra.sh"
  config.vm.provision "shell", path: "./scripts/redis.sh"
  config.vm.provision "shell", path: "./scripts/elasticsearch.sh"
  config.vm.provision "shell", path: "./scripts/memcached.sh"
  config.vm.provision "shell", path: "./scripts/postgresql.sh"
  config.vm.provision "shell", path: "./scripts/mysql.sh"
  config.vm.provision "shell", path: "./scripts/influxdb.sh"
  config.vm.provision "shell", inline: "sudo apt-get clean"
  config.vm.provision "shell", inline: "$(sudo dd if=/dev/zero of=/EMPTY bs=1M) || sudo rm -f /EMPTY"
  config.vm.provision "shell", inline: "cat /dev/null > ~/.bash_history && history -c && exit"

end
