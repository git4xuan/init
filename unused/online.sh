#/bin/env bash
if [ `curl -s https://console.online.net/en/order/server_limited | grep -c "back order"` -ne 2 ]
then
        echo "2欧的毒妇出现！！！"|mutt -s "$(date +%Y-%m-%d)毒妇出现" abc@example.com
fi
