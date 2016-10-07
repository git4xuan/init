#!/bin/bash
#这里在每台VPS上安装rsync，必要的话可以安装smb，其实还是比较简单的。
#接着可以自己挂载，这里的开机自动的部分可以暂时不考虑，毕竟停机的时间少。
#接着自己创建的文件夹。可以通过deluge测试后通过
#先装deluge


rsync_conf="https://raw.githubusercontent.com/git4xuan/init/master/files/rsyncd.conf"
rsync_secr="https://raw.githubusercontent.com/git4xuan/init/master/files/rsyncd.secrets"
pwd="`pwd`"

apt-get install --force-yes -y rsync


##########
##rsync  install

cd /tmp

##出现了rsyncd.conf 文件，rsyncd.secret xinetd.d/*(rsync)下的rsync文件，这里需要改disabled
#的变化
mv /etc/rsyncd.conf{,.bak}
mv /etc/rsyncd.secret{,.bak}

wget  -N --no-check-certificate $rsync_conf  && mv rsyncd.conf /etc/
#URL
wget  -N --no-check-certificate $rsync_secr  && mv rsyncd.secrets /etc/  && chmod 600 /etc/rsyncd.secrets

chmod 600 /etc/rsyncd.secrets
cd $pwd


###xinetd 下的部分使用sed的方式
mv /etc/default/rsync{,.bak}

#这里的文件名是不确定的，需要针对性查看。  将disable 去掉了。
#修改xinet.d
#sed -e "/disable/s/no/yes/g" /etc/default/rsync
#也使用download的方式
#sed -e "/RSYNC_ENABLE/s/true/false/g"  /etc/default/rsync   没有完全替换，只是输出
wget -N --no-check-certificate   https://raw.githubusercontent.com/git4xuan/init/master/files/rsync && mv rsync /etc/default/rsync

service rsync start
chmod 600 /etc/rsyncd.secrets


