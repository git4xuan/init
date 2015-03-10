##UnFinished:

    col=`awk 'END{print NR}' /etc/rc.local`
    sed -i ''"$col"'i nohup /usr/local/bin/ss-server -c /etc/shadowsocks/config.json > /dev/null 2>&1 &' /etc/rc.local

#Check this one

    echo ""
    echo "Congratulations, shadowsocks-libev install completed!"
    echo -e "Your Server IP: \033[41;37m ${IP} \033[0m"
    echo -e "Your Server Port: \033[41;37m 8989 \033[0m"
    echo -e "Your Password: \033[41;37m ${shadowsockspwd} \033[0m"
    echo -e "Your Local IP: \033[41;37m 127.0.0.1 \033[0m"
    echo -e "Your Local Port: \033[41;37m 1080 \033[0m"
    echo -e "Your Encryption Method: \033[41;37m aes-256-cfb \033[0m"
    echo ""
    echo "Enjoy it!"
