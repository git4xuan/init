
#echo "deb http://backports.debian.org/debian-backports squeeze-backports main" >> /etc/apt/sources.list
# wget https://raw.githubusercontent.com/git4xuan/init/master/init-zip.sh && chmod +x init-zip.sh && sh init-zip.sh
#apt-add-repository http://backports.debian.org/debian-backports
apt-get update
apt-get install --force-yes -y unzip wget

wget https://github.com/git4xuan/init/archive/master.zip && unzip master.zip && cd init-master && chmod +x init.sh && ./init.sh
cd ~
rm master.zip
rm init-zip.sh
