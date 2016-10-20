apt-get install --force-yes -y  vnstat iftop
apt-get install --force-yes -y  chkconfig

vnstat -u -i eth0

service vnstat start
chkconfig vnstat on
