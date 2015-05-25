#!/bin/bash
#将那些需要进行cron的命令都放在这里
#
touch tmpcron
crontab -l >>  tmpcron
echo "* 3 *  *  *    apt-get update -y" >> tmpcron
echo "* 4 *  *  *    apt-get upgrade -y"  >> tmpcron

crontab tmpcron
rm tmpcron
