#关于deluge部分的解释，，core和web都是要在关闭的情况下复制，core.conf~就是被移动到的文件，
deluge_conf="https://raw.githubusercontent.com/git4xuan/init/master/files/core.conf"
deluge_webconf="https://raw.githubusercontent.com/git4xuan/init/master/files/web.conf"
pwd="`pwd`"

#install --force-yes -y deluge* 
DELUGE_VERSION=1.3.6

apt-get --yes install python python-geoip python-libtorrent python-notify python-pygame python-gtk2 python-gtk2-dev python-twisted python-twisted-web2 python-openssl python-simplejson python-setuptools gettext python-xdg python-chardet librsvg2-dev xdg-utils python-mako
#kill existed deluge
kill -9 `  ps aux | grep deluge | grep -v grep | awk '{print $2}' | cut -d. -f 1` &> /dev/null  
#wget -N --no-check-certificate -O $SCRIPT
wget -N --no-check-certificate -O /tmp/deluge-$DELUGE_VERSION.tar.gz http://download.deluge-torrent.org/source/deluge-$DELUGE_VERSION.tar.gz
cd /tmp
tar xvfz deluge-$DELUGE_VERSION.tar.gz
rm deluge-$DELUGE_VERSION.tar.gz
cd deluge-$DELUGE_VERSION  ## remenber to move it

python setup.py build
python setup.py install
ldconfig

## remove it
rm -rf deluge-$DELUGE_VERSION

#make dir
mkdir  /root/download  /root/move  /home/torrents  /root/extra
#remenber apt-get will auto set deluged start 
kill -9 `  ps aux | grep deluge | grep -v grep | awk '{print $2}' | cut -d. -f 1` &> /dev/null  
deluged
kill -9 `  ps aux | grep deluge | grep -v grep | awk '{print $2}' | cut -d. -f 1` &> /dev/null  

#deluge 相关的部分


mv /root/.config/deluge/core.conf{,.bak}
mv /root/.config/deluge/web.conf{,.bak}
cd /tmp
wget -N --no-check-certificate  $deluge_conf  && mv core.conf /root/.config/deluge/
wget -N --no-check-certificate  $deluge_webconf  && mv web.conf /root/.config/deluge/

echo "deluge:1028723X:10"  >> $HOME/.config/deluge/auth

#your deluge file  with other folders created?
cd $pwd

deluged
deluge-web --fork