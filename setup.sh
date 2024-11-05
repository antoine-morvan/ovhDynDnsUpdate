#!/bin/bash

DIGFOUND=false
CURLFOUND=false
if type -f dig &> /dev/null; then
    DIGFOUND=true
fi
if type -f curl &> /dev/null; then
    CURLFOUND=true
fi

if ! $DIGFOUND && ! $CURLFOUND; then
    echo "Could not find neither dig nor curl; please install one"
    exit 1
fi

[ "$(whoami)" != root ] && sudo "$0" && exit 0

DIR=$(dirname $(readlink -f $BASH_SOURCE))

mkdir -p /usr/local/bin/
cp ${DIR}/update_ovh_dyndns /usr/local/bin/update_ovh_dyndns
chmod +x /usr/local/bin/update_ovh_dyndns
chmod og-w /usr/local/bin/update_ovh_dyndns
ln -s /usr/local/bin/update_ovh_dyndns /etc/cron.hourly/update_ovh_dyndns

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
