自用的脚本，主要用来自动添加相关的服务，暂时没有使用puppet，其他的再说啦。
files文件夹直接作为一个公开的configserver吧。
应该只写C和S，先跑上ubuntu的吧。
#####安全部分
安全部分通用，需要加上
+ 定期update upgrade
+ host.deny
+ 后期的md5
+ 关闭ssh的密码登陆，通过替换config文件的方式就可以了。。传输ssh的公钥文件或用专门的命令
#####安装的东西
+ 全部的btsync
+ 全部的deluged
+ 还是要用sshfs，没法用NFS
+ ss的相关，希望可以UDP
#####其他
后期添加，最近抓不出整块的时间，还是下次分片时间完成吧。

## update01
添加vim nano
修改aes转为chacha20
修改go get的方式为版本指定  gopkg.in/xtaci/kcptun.v20171201/client gopkg.in/xtaci/kcptun.v20171201/server 等
