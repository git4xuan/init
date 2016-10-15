#!/bin/bash
location="`pwd`"

apt-get install -y libssl-dev build-essential zlib1g-dev git
cd /tmp
git clone https://github.com/eeertekin/bbcp.git
cd bbcp/src
make
cp  -rf ../bin/* ../bin/temp
chmod +x ../bin/temp/bbcp
cp ../bin/temp/bbcp /bin/bbcp

rm -rf /tmp/bbcp

cd $location
