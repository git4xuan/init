#!/bin/bash
#Secure shell
#添加自动更新，和host.deny 脚本
#这是来自东北大学的ssh的防暴力破解的脚本
#URL = http://neucert.neu.edu.cn/archives/174
#需要添加至crontab自动更新

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
URL=http://antivirus.neu.edu.cn/ssh/lists/neu_sshbl_hosts.deny.gz
HOSTSDENY=/etc/hosts.deny
TMP_DIR=/dev/shm
FILE=hosts.deny
cd $TMP_DIR
curl $URL 2> /dev/null | gzip -dc > $FILE
LINES=`grep "^sshd:" $FILE | wc -l`
if [ $LINES -gt 10 ]
then
sed -i ‘/^####SSH BlackList START####/,/^####SSH BlackList END####/d’ $HOSTSDENY
echo "####SSH BlackList START####" >> $HOSTSDENY
cat $FILE >> $HOSTSDENY
echo "####SSH BlackList END####" >> $HOSTSDENY
fi
