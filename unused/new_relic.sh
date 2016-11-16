echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list
wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -
apt-get update
sleep 2
apt-get install newrelic-sysmond
nrsysmond-config --set license_key=972d5cd80e7d288accd5cacb5b0669706701014b
/etc/init.d/newrelic-sysmond start

