pypi_config="index-url = https://pypi.mirrors.ustc.edu.cn/simple"
pypi_section="[header]"
mv  ~/.pip/pip.conf{,.bak}


echo $pypi_section >> ~/.pip/pip.conf
echo $pypi_config >> ~/.pip/pip.conf

###小文件全部使用aws的s3，，，，b2居然会在pypi上出现无法安装的情况。。。
### s3 在 小文件上也不贵啊。