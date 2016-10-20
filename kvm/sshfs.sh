#!/bin/bash

mkdir /mnt/rn /mnt/ram
###vpsssh private key~
apt-get install -y sshfs fuse
modprobe fuse

sshfs -o  allow_other,IdentityFile=/root/.ssh/vpsssh root@rn.fengidea.com:/root/ /mnt/rn

sshfs -o  allow_other,IdentityFile=/root/.ssh/vpsssh root@ram.fengidea.com:/root/ /mnt/ram

## scp -i .ssh/newauth .ssh/vpsssh root@45.32.104.223:/root/.ssh/

## test
## rsync -avrP /mnt/ram/move/ /home

## local
## sshfs -o  allow_other,IdentityFile=/root/.ssh/vpsssh root@tskvm.fengidea.com:/mnt/ /mnt/WDPurple/MountPoint
## test
## rsync -avrP /mnt/WDPurple/MountPoint/ram/move /mnt/WDPurple/S3OSS
