#!/bin/bash
fdt_addr="http://monalisa.cern.ch/FDT/lib/fdt.jar"

apt-get install --force-yes -y openjdk-7-jdk

wget -O fdt.jar  -N --no-check-certificate $fdt_addr  && mv fdt.jar /usr/local/fdt.jar

cp ./files/fdtServer.sh /usr/bin  && chmod +x /usr/bin/fdtServer.sh



