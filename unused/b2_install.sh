pypi_config="index-url = https://pypi.mirrors.ustc.edu.cn/simple"
pypi_section="[header]"
mv  ~/.pip/pip.conf{,.bak}


echo $pypi_section >> ~/.pip/pip.conf
echo $pypi_config >> ~/.pip/pip.conf

###С�ļ�ȫ��ʹ��aws��s3��������b2��Ȼ����pypi�ϳ����޷���װ�����������
### s3 �� С�ļ���Ҳ���󰡡�