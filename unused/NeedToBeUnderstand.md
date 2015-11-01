##UnFinished:

    col=`awk 'END{print NR}' /etc/rc.local`
    sed -i ''"$col"'i nohup /usr/local/bin/ss-server -c /etc/shadowsocks/config.json > /dev/null 2>&1 &' /etc/rc.local
