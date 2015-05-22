#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#由之前的teddysun的改变而来。

clear

# Install Shadowsocks-libev
function install_shadowsocks_libev(){
    rootness
    disable_selinux
    pre_install
    download_files
    config_shadowsocks
    install_libev
}

# Make sure only root can run our script
function rootness(){
if [[ $EUID -ne 0 ]]; then
   echo "Error:This script must be run as root!" 1>&2
   exit 1
fi
}

# Disable selinux
function disable_selinux(){
if [ -s /etc/selinux/config ] && grep 'SELINUX=enforcing' /etc/selinux/config; then
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    setenforce 0
fi
}

# Pre-installation settings
function pre_install(){
    #直接放置配置文件，下次更新时候用

    # Update System
    apt-get -y update
    # Install necessary dependencies
    apt-get install -y wget unzip curl build-essential autoconf libtool libssl-dev
    # Get IP address
    echo "Getting Public IP address, Please wait a moment..."
    IP=$(curl -s -4 icanhazip.com)
    if [[ "$IP" = "" ]]; then
        IP=$(curl -s -4 ipinfo.io | grep "ip" | awk -F\" '{print $4}')
    fi
    echo -e "Your main public IP is\t\033[32m$IP\033[0m"
    echo ""
    #Current folder
    cur_dir=`pwd`
    cd $cur_dir
}

# Download latest shadowsocks-libev
function download_files(){
    if [ -f shadowsocks-libev.zip ];then
        echo "shadowsocks-libev.zip [found]"
    else
        if ! wget --no-check-certificate https://github.com/shadowsocks/shadowsocks-libev/archive/master.zip -O shadowsocks-libev.zip;then
            echo "Failed to download shadowsocks-libev.zip"
            exit 1
        fi
    fi
    unzip shadowsocks-libev.zip
    if [ $? -eq 0 ];then
        cd $cur_dir/shadowsocks-libev-master/
        if ! wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev-debian; then
            echo "Failed to download shadowsocks-libev start script!"
            exit 1
        fi
    else
        echo ""
        echo "Unzip shadowsocks-libev failed! "
        exit 1
    fi
}

# Config shadowsocks
function config_shadowsocks(){
    if [ ! -d /etc/shadowsocks-libev ];then
        mkdir /etc/shadowsocks-libev
    fi
    #直接将json文件cp进去,这里上面有个启动文件变化，所以位置和名字不变为默认，当然可以用supervisord额
    # /etc/shadowsocks-libev/config.json
    if ! wget -N  --no-check-certificate https://bitbucket.org/api/2.0/snippets/git4xuan/KLjj/64deb96d298feca17431ef9fd548d2c7e90bf120/files/config.json;then
        echo "Failed to download shadowsocks-libev start script!"
        exit 1
    else
        mv config.json /etc/shadowsocks-libev/config.json
        echo "configure finished"
    fi

}

# Install
function install_libev(){
    # Build and Install shadowsocks-libev
    if [ -s /usr/local/bin/ss-server ];then
        echo "shadowsocks-libev has been installed!"
        exit 0
    else
        ./configure
        make && make install
        if [ $? -eq 0 ]; then
            # Add run on system start up
            mv $cur_dir/shadowsocks-libev-master/shadowsocks-libev-debian /etc/init.d/shadowsocks
            chmod +x /etc/init.d/shadowsocks
            update-rc.d shadowsocks defaults
            # Run shadowsocks in the background
            /etc/init.d/shadowsocks start
            # Run success or not
            if [ $? -eq 0 ]; then
                echo "Shadowsocks-libev start success!"
            else
                echo "Shadowsocks-libev start failure!"
            fi
        else
            echo ""
            echo "Shadowsocks-libev install failed!"
            exit 1
        fi
    fi
    cd $cur_dir
    # Delete shadowsocks-libev floder
    rm -rf $cur_dir/shadowsocks-libev-master/
    # Delete shadowsocks-libev zip file
    rm -f shadowsocks-libev.zip
    clear
    echo "Install completed! "
}

# Uninstall Shadowsocks-libev
function uninstall_shadowsocks_libev(){
    printf "Are you sure uninstall Shadowsocks-libev? (y/n) "
    printf "\n"
    read -p "(Default: n):" answer
    if [ -z $answer ]; then
        answer="n"
    fi
    if [ "$answer" = "y" ]; then
        ps -ef | grep -v grep | grep -v ps | grep -i "ss-server" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            /etc/init.d/shadowsocks stop
        fi
        # remove auto start script
        update-rc.d -f shadowsocks remove
        # delete config file
        rm -rf /etc/shadowsocks-libev
        # delete shadowsocks
        rm -f /usr/local/bin/ss-local
        rm -f /usr/local/bin/ss-tunnel
        rm -f /usr/local/bin/ss-server
        rm -f /usr/local/bin/ss-redir
        rm -f /usr/local/lib/libshadowsocks.a
        rm -f /usr/local/lib/libshadowsocks.la
        rm -f /usr/local/include/shadowsocks.h
        rm -rf /usr/local/lib/pkgconfig
        rm -f /usr/local/share/man/man8/shadowsocks.8
        echo "Shadowsocks-libev uninstall success!"
    else
        echo "uninstall cancelled, Nothing to do"
    fi
}

# Initialization step
action=$1
[  -z $1 ] && action=install
case "$action" in
install)
    install_shadowsocks_libev
    ;;
uninstall)
    uninstall_shadowsocks_libev
    ;;
*)
    echo "Arguments error! [${action} ]"
    echo "Usage: `basename $0` {install|uninstall}"
    ;;
esac
