### add vpsssh
### remenber save private key to s3 bucket，，，，

echo -e "\n" >> ~/.ssh/authorized_keys
vps_pub_key="ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAYEApvuHIlPR/zF/4nEMxY0gpSjpJnVS8vtiPSxgw6po3Ba7v6QxLTC6T7vqvV5kaO6jk6nQsvHZY27mubRmxSHp5QA+qyafBxOhwEacvecYQO9ovU52FLEgVOfD3rhIWKWFaaIBzbVjWaNdMJR8lhrnl8tOJLptgrXLHcTVEpnIdUTMs92G9UBNMv78zTlh9w62RHXgRAgqodSHzMjIK4r7NSeKpO6QwU9qQ04PxB/f59clltl3cxYVg1nfDHskMwu8/twryGzTxDMTIE32emVdRChKdSogAKA5Bz9pWSaCfhDRmWHqh78T/Ng8XDmoDus8lljfUR8XfzZWnkO6eW4yoVPnBT9u6A+6jXRyP1S3u2oFY9KJKtDBK8t0zlhMCSMrRZu9JiVp1PEwUUSn5oiN5cFAFzyhakA669+kiQD9uwb+e0zDUACYxo/pQTGaQzo+UOqfp7yVHBOGvMzBC/ao3xOmprAu78Sd4wHz6NoZpC8GW9C5KUSjyXfyJDfPFoQ9"
echo $vps_pub_key >> ~/.ssh/authorized_keys
