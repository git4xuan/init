#!/bin/bash
# install shadowsocks

echo "deb http://backports.debian.org/debian-backports squeeze-backports main" >> /etc/apt/sources.list

apt-get -o Acquire::ForceIPv4=true update --force-yes   -y
apt-get upgrade --force-yes  -y

apt-get --force-yes  -y install pip
apt-get --force-yes  -y install python python-dev python-pip curl wget unzip gcc swig automake make perl cpio

pip install M2Crypto
pip install greenlet
pip install gevent
pip install shadowsocks


#wget -N --no-check-certificate https://bitbucket.org/api/2.0/snippets/git4xuan/KLjj/64deb96d298feca17431ef9fd548d2c7e90bf120/files/config.json && mv config.json /etc/shadowsocks.json
mv ./files/shadowsocks.json /etc/shadowsocks.json

nohup ssserver -c /etc/shadowsocks.json  &
