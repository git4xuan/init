##�ű������ͬ������ʹ���ƴ洢��㣬��������������趨��Ӧ�Ķ˿�ֵ�������ˡ�
## �ƴ洢���ź�ͬ����һ�ַ�ʽ������ȥ������
##����loadģ��ķ�ʽ
import random
import os
import sys
import string

chars=string.ascii_letters+string.digits


IP = 
BIN=/usr/local/shadowsocks/shadowsocks/server.py
#$BIN -c $conf -d start


random_server_port = random.randint(28000,40000)
random_password = ''.join([random.choice(chars) for i in range(15)])
METHOD = "rc4-md5"  ## chacha20
OBFS = "http_simple_compatible"
TIMEOUT = "120"
WORKERS = 2

ssr_server_start = "$BIN -p $random_server_port -k $random_password -m $method -o $OBFS -t $TIMEOUT --workers $WORKERS -d start"