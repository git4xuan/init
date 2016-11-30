#!/usr/bin/bash

cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
nohup ~/.dropbox-dist/dropboxd &
##查看nohup.out的下的网址给出认证
