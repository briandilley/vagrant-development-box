# vagrant-development-box
This repository holds the scripts that build the development vagrant box located at: https://app.vagrantup.com/briandilley/boxes/development.

To use it simply create a `Vagrantfile` with the following:

    Vagrant.configure("2") do |config|
      config.vm.box = "briandilley/development"
      config.vm.box_version = "1.0.0"
      # additional options from below for which services to start
    end

For optimal conditions you'll want to set the # of CPUs to be at least 2 and 6144mb of ram.

## Services
The following services are installed by default but are not started.  You will need to add these to your Vagrant file to have them start by default.

- ElasticSearch
    - port: 9200
    - network configuration: `config.vm.network :forwarded_port, guest: 9200, host: 9200`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d elasticsearch enable"`
- Kibana
    - port: 5601
    - network configuration: `config.vm.network :forwarded_port, guest: 5601, host: 5601`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d kibana enable"`
- Redis
    - port: 6379
    - network configuration: `config.vm.network :forwarded_port, guest: 6379, host: 6379`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d redis-server enable"`
- RedisCluster
    - ports: 6380, 6381, 6382
    - network configuration: `config.vm.network :forwarded_port, guest: 6380, host: 6380`
    - network configuration: `config.vm.network :forwarded_port, guest: 6381, host: 6381`
    - network configuration: `config.vm.network :forwarded_port, guest: 6382, host: 6382`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d redis-server0 enable"`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d redis-server1 enable"`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d redis-server2 enable"`
- PostgreSQL 9.6
    - port: 5432
    - user: develop
    - password: develop
    - database: develop
    - network configuration: `config.vm.network :forwarded_port, guest: 5432, host: 5432`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d postgresql enable"`
- MySQL
    - port: 3306
    - user: develop
    - password: develop
    - database: develop
    - network configuration: `config.vm.network :forwarded_port, guest: 3306, host: 3306`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d mysql enable"`
- Memcached
    - port: 11211
    - network configuration: `config.vm.network :forwarded_port, guest: 11211, host: 11211`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d memcached enable"`
- InfluxDB
    - port: 8086
    - network configuration: `config.vm.network :forwarded_port, guest: 8086, host: 8086`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d influxdb enable"`
- Chronograf
    - port: 8008
    - network configuration: `config.vm.network :forwarded_port, guest: 8008, host: 8008`
    - autostart: `config.vm.provision "shell", inline: "update-rc.d chronograf enable"`
- Telegraf
    - autostart: `config.vm.provision "shell", inline: "update-rc.d telegraf enable"`
- Cassandra
    - ports: 9031, 9032, 9033, 9161, 9162, 9163, 
    - autostart: `config.vm.provision "shell", inline: "/bin/bash /opt/cassandra.sh"`
    - network configuration: `config.vm.network "private_network", ip: "10.0.2.31"`
    - network configuration: `config.vm.network "private_network", ip: "10.0.2.32"`
    - network configuration: `config.vm.network "private_network", ip: "10.0.2.33"`
    - network configuration: `config.vm.network "forwarded_port", guest: 9042, guest_ip: "10.0.2.31", host: 9031`
    - network configuration: `config.vm.network "forwarded_port", guest: 9042, guest_ip: "10.0.2.32", host: 9032`
    - network configuration: `config.vm.network "forwarded_port", guest: 9042, guest_ip: "10.0.2.33", host: 9033`
    - network configuration: `config.vm.network "forwarded_port", guest: 9160, guest_ip: "10.0.2.31", host: 9161`
    - network configuration: `config.vm.network "forwarded_port", guest: 9160, guest_ip: "10.0.2.32", host: 9162`
    - network configuration: `config.vm.network "forwarded_port", guest: 9160, guest_ip: "10.0.2.33", host: 9163`
