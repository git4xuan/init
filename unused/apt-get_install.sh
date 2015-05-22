#!/bin/bash


###Install deluge and web-UI , folder-where
##shell
apt-get install -y deluge*
###Install NodeQurey  remember Auth Key


###Install nginx and add special-web-index
###不安装nginx  这里防止一下，反正就是用ssh的连接方式

###Install fuse sshfs  mkdir
apt-get install -y fuse sshfs

###Install btsync(for private files? or you can use rcp or other way)

###install bind-tools iftop and others
apt-get install -y iftop bind-tools
