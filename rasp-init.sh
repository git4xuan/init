#!/bin/sh

#First change sshd Password auth

#add cow proxy to provide clean env
sh

#replace source-list to utsc mirror
if [ ! -f "/etc/apt/source-list" ];then
    echo  "source-list not found! "
elif
    mv /etc/apt/source-list{,.bak}
    cat>/etc/apt/source-list<<eof
deb http://mirrors.ustc.edu.cn/raspbian/raspbian/ jussie main non-free contrib
deb-src http://mirrors.ustc.edu.cn/raspbian/raspbian/ jussie main non-free contrib

eof
fi

#apt update
# only root user can run
apt-get update
#git have installed in raspbian

#git clone begin
