Simple bash scripts to update the IP of a dynamic host on OVH.

Update process is described here: https://docs.ovh.com/fr/domains/utilisation-dynhost/

The script actually checks few things then simply call the following command:
```
curl -u ${DYNDNS_USER}:${DYNDNS_PASS} "http://www.ovh.com/nic/update?system=dyndns&hostname=${DYNDNS_DOMAIN}&myip=${PUBLIC_IP}"
```

The public IP is resolved using **OpenDNS** or **4.icanhazip.com** courtesy:
```
dig +short myip.opendns.com @resolver1.opendns.com -4
curl 4.icanhazip.com
```
