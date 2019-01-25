# vagrant-development-box
This repository holds the scripts that build the development vagrant box located at: https://app.vagrantup.com/briandilley/boxes/development.

To use it simply create a `Vagrantfile` with the configuration below, and uncomment the services that you need.  The rest of the services will not be started.

    Vagrant.configure("2") do |config|
      config.vm.box = "briandilley/development"

      # optimal settings for virtualbox
      config.vm.provider "virtualbox" do |vb|
        # vb.gui = true
        vb.memory = 6144
        vb.cpus = 2
      end

      #####
      ## Uncomment the services that you'd like to enable below.
      ##

      #####
      ## ElasticSearch
      ##
      # config.vm.network :forwarded_port, guest: 9200, host: 9200
      # config.vm.provision "shell", inline: "update-rc.d elasticsearch enable"
      # config.vm.provision "shell", inline: "service elasticsearch start"

      #####
      ## Kibana
      ##
      # config.vm.network :forwarded_port, guest: 5601, host: 5601
      # config.vm.provision "shell", inline: "update-rc.d kibana enable"
      # config.vm.provision "shell", inline: "service kibana start"

      #####
      ## Redis
      ##
      # config.vm.network :forwarded_port, guest: 6379, host: 6379
      # config.vm.provision "shell", inline: "update-rc.d redis-server enable"
      # config.vm.provision "shell", inline: "service redis-server start"

      #####
      ## RedisCluster
      ##
      # config.vm.network :forwarded_port, guest: 6380, host: 6380
      # config.vm.network :forwarded_port, guest: 6381, host: 6381
      # config.vm.network :forwarded_port, guest: 6382, host: 6382
      # config.vm.provision "shell", inline: "update-rc.d redis-server0 enable"
      # config.vm.provision "shell", inline: "update-rc.d redis-server1 enable"
      # config.vm.provision "shell", inline: "update-rc.d redis-server2 enable"
      # config.vm.provision "shell", inline: "service redis-server0 start"
      # config.vm.provision "shell", inline: "service redis-server1 start"
      # config.vm.provision "shell", inline: "service redis-server2 start"

      #####
      ## PostgreSQL
      ## user: develop, password: develop, database: develop
      ##
      # config.vm.network :forwarded_port, guest: 5432, host: 5432
      # config.vm.provision "shell", inline: "update-rc.d postgresql enable"
      # config.vm.provision "shell", inline: "service postgresql start"

      #####
      ## MySQL
      ## user: develop, password: develop, database: develop
      ##
      # config.vm.network :forwarded_port, guest: 3306, host: 3306
      # config.vm.provision "shell", inline: "update-rc.d mysql enable"
      # config.vm.provision "shell", inline: "service mysql start"

      #####
      ## Memcached
      ##
      # config.vm.network :forwarded_port, guest: 11211, host: 11211
      # config.vm.provision "shell", inline: "update-rc.d memcached enable"
      # config.vm.provision "shell", inline: "service memcached start"

      #####
      ## InfluxDB
      ##
      # config.vm.network :forwarded_port, guest: 8086, host: 8086
      # config.vm.provision "shell", inline: "update-rc.d influxdb enable"
      # config.vm.provision "shell", inline: "service influxdb start"

      #####
      ## Chronograf
      ##
      # config.vm.network :forwarded_port, guest: 8008, host: 8008
      # config.vm.provision "shell", inline: "update-rc.d chronograf enable"
      # config.vm.provision "shell", inline: "service chronograf start"

      #####
      ## Telegraf
      ##
      # config.vm.provision "shell", inline: "update-rc.d telegraf enable"
      # config.vm.provision "shell", inline: "service telegraf start"

      #####
      ## Cassandra
      ##
      # config.vm.network "private_network", ip: "10.0.2.31"
      # config.vm.network "private_network", ip: "10.0.2.32"
      # config.vm.network "private_network", ip: "10.0.2.33"
      # config.vm.network "forwarded_port", guest: 9042, guest_ip: "10.0.2.31", host: 9031
      # config.vm.network "forwarded_port", guest: 9042, guest_ip: "10.0.2.32", host: 9032
      # config.vm.network "forwarded_port", guest: 9042, guest_ip: "10.0.2.33", host: 9033
      # config.vm.network "forwarded_port", guest: 9160, guest_ip: "10.0.2.31", host: 9161
      # config.vm.network "forwarded_port", guest: 9160, guest_ip: "10.0.2.32", host: 9162
      # config.vm.network "forwarded_port", guest: 9160, guest_ip: "10.0.2.33", host: 9163
      # config.vm.provision "shell", inline: "update-rc.d cassandra enable"
      # config.vm.provision "shell", inline: "service cassandra start"

    end
