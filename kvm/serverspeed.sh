ori_pwd=`pwd`
tmp_location=/tmp/serverspeeder
mkdir $tmp_location
cd $tmp_location

wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh && bash serverspeeder-all.sh

rm -r $tmp_location
cd $ori_pwd

###备注，aws 下的pv虚拟化，可以使用的实例为 ami-e05c45e1   debian 7 pv虚拟化。
### 可以使用竞价型实例。

####  linux-image-3.2.0-4-amd64 debian的。