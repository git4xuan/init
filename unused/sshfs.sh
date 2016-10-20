#!/bin/bash

apt-get install -y sshfs
mkdir /mnt/rn mnt/ram
###vpsssh private key~
sshfs -o  allow_other,IdentityFile=/root/.ssh/vpsssh root@rn.fengidea.com:/root/ /mnt/rn

sshfs -o  allow_other,IdentityFile=/root/.ssh/vpsssh root@ram.fengidea.com:/root/ /mnt/ram
