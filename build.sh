#!/bin/bash -e

function bar() {
    max=$1
    echo -ne "["
    for i in `seq 1 $max`
    do
        for j in `seq 1 $i`
        do
            echo -ne "|"
        done
        for j in `seq $(($i + 1)) $max`
        do
            echo -ne " "
        done
        echo -ne "] "
        sleep 1
        if [[ "$i" == "$max" ]];
        then
            return
        fi
        for j in `seq 1 $max`
        do
            echo -ne "\b"
        done
        echo -ne "\b\b"
    done
}

vagrant up

box_id=$(VBoxManage list vms | grep vagrant | sed -E 's/"(.*vagrant.*)\".*/\1/')

rm -rf development.box
vagrant halt

echo "Packaging $box_id in 30 seconds"
bar 30
echo ""
vagrant package --base $box_id --output development.box

vagrant box add development development.box

vagrant destroy
