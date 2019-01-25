#!/bin/bash

vagrant up

echo -e "NOW RUN:\nvagrant package --base ID_FROM_VIRTUAL_BOX_HERE --output development.box"
echo "vagrant box add development development.box"
echo "vagrant destroy"
