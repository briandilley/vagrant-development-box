#!/bin/bash

vagrant up

vagrant package --output development.box

vagrant box add development development.box

vagrant destroy

