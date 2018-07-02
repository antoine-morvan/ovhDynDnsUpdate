#!/bin/bash

[ "$(whoami)" != root ] && sudo "$O"

DIR=$(cd $(dirname $0) && pwd)

cp ${DIR}/update_ovh_dyndns /usr/local/bin/update_ovh_dyndns
chmod +x /usr/local/bin/update_ovh_dyndns
chmod og-w /usr/local/bin/update_ovh_dyndns
ln -s /usr/local/bin/update_ovh_dyndns /etc/cron.hourly

read -p "OVH User: " DYNDNS_USER
read -s -p "OVH Password: " DYNDNS_PASSWORD
echo ""
read -p "OVH Domain Name: " DYNDNS_DOMAIN

cat > /etc/dyndns_ovh.conf << EOF
USER=$DYNDNS_USER
PASS=$DYNDNS_PASSWORD
DOMAIN=$DYNDNS_DOMAIN
EOF

chmod 600 /etc/dyndns_ovh.conf
