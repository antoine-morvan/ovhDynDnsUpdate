# ovhDynDnsUpdate

Simple bash scripts to update the IP of a dynamic host on OVH.

## How this works

Update process is described here: https://docs.ovh.com/fr/domains/utilisation-dynhost/

The script actually checks few things then simply call the following command:
```sh
curl -u ${DYNDNS_USER}:${DYNDNS_PASS} "http://www.ovh.com/nic/update?system=dyndns&hostname=${DYNDNS_DOMAIN}&myip=${PUBLIC_IP}"
```

The public IP is resolved using **OpenDNS** or **4.icanhazip.com** courtesy:
```sh
dig +short myip.opendns.com @resolver1.opendns.com -4
curl 4.icanhazip.com
```

## Change Config & Force Update

```sh
# Edit config file (use sudo, permission is 600)
sudo vi /etc/dyndns_ovh.conf
# Remove last IP file
sudo rm /var/cache/dyndns_ovh_last_ip
# Run installed script
sudo /usr/local/bin/update_ovh_dyndns
```
