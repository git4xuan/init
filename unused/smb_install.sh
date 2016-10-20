pwd =  `pwd`
### none to change smbpassword ,add change .
### using like {{  mount.cifs //tskvm.fengidea.com/mnt /home/mp -o user=root }} to test ,,,before mkdir /home/mp
### /mnt/WDPurple/MountPoint
##mount.cifs //tskvm.fengidea.com/mnt /mnt/WDPurple/MountPoint -o user=root
apt-get install -y samba samba-common libcups2 smbclient cifs-utils
mv /etc/samba/smb.conf{,.bak}
cp ../files/smb.conf  /etc/samba/smb.conf

service samba status
