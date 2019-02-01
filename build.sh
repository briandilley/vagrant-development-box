#!/bin/bash -e

vagrant up

box_id=$(VBoxManage list vms | grep vagrant | sed -E 's/"(.*vagrant.*)\".*/\1/')

rm -rf development.box

echo "Packaging $box_id"
vagrant package --base $box_id --output development.box

vagrant box add development development.box

vagrant destroy
