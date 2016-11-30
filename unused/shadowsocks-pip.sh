#!/bin/bash
# install shadowsocks

echo "deb http://backports.debian.org/debian-backports squeeze-backports main" >> /etc/apt/sources.list

apt-get update -y
apt-get upgrade -y

apt-get install pip

pip install shadowsocks

wget -N --no-check-certificate https://bitbucket.org/api/2.0/snippets/git4xuan/KLjj/64deb96d298feca17431ef9fd548d2c7e90bf120/files/config.json && mv config.json /etc/shadowsocks.json

nohup ssserver -c /etc/shadowsocks.json &
