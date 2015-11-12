#!/bin/bash
#将那些需要进行cron的命令都放在这里
#cronfile  配置相关！！
touch /etc/cronfile
echo "* 3 *  *  *    apt-get update -y" >> /etc/cronfile
echo "* 4 *  *  *    apt-get upgrade -y"  >> /etc/cronfile
crontab /etc/cronfile
