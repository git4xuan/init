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

apt-get install --force-yes -y  bash wget curl sudo psmisc screen
apt-get install --force-yes -y  git zsh
apt-get install --force-yes -y  build-essential
apt-get install --force-yes -y  vim



## git pull
git clone http://github.com/git4xuan/init.git
cd init



apt-get install -y virt-what

chmod +x kvm/*.sh
chmod +x ovz/*.sh
chmod +x start/*.sh


## ovz kvm check
arch=`virt-what`
if [ $arch = "kvm" ]; then
	for tmp  in `ls kvm/`
		do
         sleep 1
         ././kvm/$tmp
		done
elif [ $arch = "xen" ]; then
	echo "XEN-PV"
elif [ $arch = "ovz" ]; then
	for tmp  in `ls ovz/`
		do
         sleep 1
         ././ovz/$tmp
		done
else
	echo "Unsupported Arch"
fi

for tmp  in `ls start/`
	do
	 sleep 1
	 ././start/$tmp
	done
