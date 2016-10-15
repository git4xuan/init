#!/bin/bash
#based on Ubuntu 只用下面这一个，，
# wget https://raw.githubusercontent.com/git4xuan/init/master/init.sh && chmod +x init.sh  && ./init.sh

##需要在/root 文件夹下
###Using apt-get install
#sudo  apt-get install -y git
#git clone http://github.com/git4xuan/init.git
#cd init

### only use this one:   wget https://raw.githubusercontent.com/git4xuan/init/master/init.sh

apt-get -o Acquire::ForceIPv4=true update -y
apt-get upgrade   -y

apt-get install --force-yes -y  bash wget curl
apt-get install --force-yes -y  git zsh
apt-get install --force-yes -y  build-essential


## git pull
git clone http://github.com/git4xuan/init.git
cd init

#apt-get install -y rsync
chmod +x start/*.sh
for tmp  in `ls start/`
    do
         sleep 1
         ././start/$tmp
done
