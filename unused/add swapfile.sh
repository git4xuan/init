#/bin/bash
#First check /swapfile not exist

fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
echo "vm.swappiness=20" >> /etc/sysctl.conf

sysctl vm.vfs_cache_pressure=50
