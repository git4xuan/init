#!/bin/bash
#based on Ubuntu
###Using apt-get install
sudo apt-get install -y supervisor deluge*

chmod +x start/*.sh
for tmp  in `ls start/`
    do
         ././start/$tmp
done
