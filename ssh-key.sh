#!/bin/bash
# add my ssh-key into folders
if   [ ! -d ~/.ssh/ ] ; then
	mkdir ~/.ssh
fi
apt-get install sshd wget -y

mv /etc/ssh/sshd_config{,.bak}

wget -N --no-check-certificate https://raw.githubusercontent.com/git4xuan/MyScripts/master/SSH/files/id_rsa_2048onekey.pub && mv id_rsa_2048onekey.pub ~/.ssh/authorized_keys

chmod 600   ~/.ssh/authorized_keys
chmod 700   ~/.ssh/
wget -N --no-check-certificate  https://raw.githubusercontent.com/git4xuan/MyScripts/master/SSH/files/sshd_config_sample  && mv sshd_config_sample /etc/ssh/sshd_config

/etc/init.d/sshd restart
