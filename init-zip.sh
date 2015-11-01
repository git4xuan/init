
#echo "deb http://backports.debian.org/debian-backports squeeze-backports main" >> /etc/apt/sources.list

#apt-add-repository http://backports.debian.org/debian-backports

apt-get install -y unzip wget

wget https://github.com/git4xuan/init/archive/master.zip && unzip master.zip && cd init-master && chmod +x init.sh && ./init.sh

rm master.zip
rm init-zip.sh
