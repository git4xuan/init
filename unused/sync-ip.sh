#!/bin/bash

# $1 为 IP  $2 为 sync的位置

if ! [[ -z $1 ]] ;then
        echo "you will connect to ${1}   "
        export RSYNC_PROXY="172.16.149.128:7777"
        rsync -avrP --password-file=secrets root@${1}::youtube  .
else
        echo "add your IP address!"
        echo "export RSYNC_PROXY=\"172.16.149.128:7777\" && rsync -avrP --password-file=secrets root@${1}::youtube .    "
        exit 1
fi
