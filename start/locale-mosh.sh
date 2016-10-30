echo "LANG=\"en_US.UTF-8\"" >> /tmp/locale.file
echo "LANGUAGE=\"en_US:en\"" >> /tmp/locale.file
mv /tmp/locale.file /etc/default/locale
locale-gen en_US.UTF-8

apt-get install -y mosh

#nohup mosh-server >/dev/null    2>&1 &


