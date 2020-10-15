#!/bin/bash -e

#echo 'datasource_list: [ None ]' | sudo -s tee /etc/cloud/cloud.cfg.d/90_dpkg.cfg
#sudo apt-get purge cloud-init -y 
#sudo rm -rf /etc/cloud/
#sudo rm -rf /var/lib/cloud/

wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
chown -R vagrant:vagrant .ssh

#sudo sed -i.backup -E 's/auto[[:blank:]]+([^[:blank:]]+)/allow-hotplug \1/g' /etc/network/interfaces
#echo "Contents of /etc/network/interfaces:"
#echo "#########################################"
#cat /etc/network/interfaces || true
#echo ""
#echo "#########################################"

sudo apt-get autoremove -y
sudo apt-get clean -y
$(sudo dd if=/dev/zero of=/EMPTY bs=1M) || sudo rm -f /EMPTY
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
