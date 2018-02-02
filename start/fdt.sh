#!/bin/bash
fdt_addr="http://oy2v5m0ma.bkt.clouddn.com/fdt.jar"

apt-get install -y default-jdk

wget -O fdt.jar  -N --no-check-certificate $fdt_addr  && mv fdt.jar /usr/local/fdt.jar

cp ./files/fdtServer.sh /usr/bin  && chmod +x /usr/bin/fdtServer.sh



