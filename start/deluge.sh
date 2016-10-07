#关于deluge部分的解释，，core和web都是要在关闭的情况下复制，core.conf~就是被移动到的文件，
deluge_conf="https://raw.githubusercontent.com/git4xuan/init/master/files/core.conf"
deluge_webconf="https://raw.githubusercontent.com/git4xuan/init/master/files/web.conf"
pwd="`pwd`"

apt-get install --force-yes -y deluge* 

#make dir
mkdir  /root/download  /root/move  /home/torrents  /root/extra
#remenber apt-get will auto set deluged start 
killall deluged
deluged
killall deluged

#deluge 相关的部分
sleep 5

mv /root/.config/deluge/core.conf{,.bak}
mv /root/.config/deluge/web.conf{,.bak}
cd /tmp
wget -N --no-check-certificate  $deluge_conf  && mv core.conf /root/.config/deluge/
wget -N --no-check-certificate  $deluge_webconf  && mv web.conf /root/.config/deluge/

echo "deluge:1028723X:10"  >> $HOME/.config/deluge/auth

#your deluge file  with other folders created?
cd $pwd

deluged
deluge-web --fork