##Backup to Dropbox folders

locale=/root/Dropbox/GhostBackup
mkdir -p ${locale}

echo "1 1 * * * tar -zcf /root/Dropbox/GhostBackup/ghost-\$(date +\"%y-%m-%d\").tar.gz   /var/www/ghost/ " >> /etc/cronfile
crontab /etc/cronfile
