#!/bin/sh

checkRequiredEnvironmentVariable() {
  RED='\033[0;31m'

  if [[ -z $(printenv $1) ]]; then
    printf "${RED}ERROR: $1 required\n" >> /dev/stderr
    exit 100
  fi
}

checkRequiredEnvironmentVariable "DASHBOARD_USER"
checkRequiredEnvironmentVariable "DASHBOARD_PWD"
checkRequiredEnvironmentVariable "TOKEN"
checkRequiredEnvironmentVariable "SUBDOMAIN_HOST"

sed -i "s|{DASHBOARD_USER}|$DASHBOARD_USER|g" /opt/frp/frps.ini
sed -i "s|{DASHBOARD_PWD}|$DASHBOARD_PWD|g"   /opt/frp/frps.ini
sed -i "s|{TOKEN}|$TOKEN|g"                   /opt/frp/frps.ini
sed -i "s|{SUBDOMAIN_HOST}|$SUBDOMAIN_HOST|g" /opt/frp/frps.ini

/opt/frp/frps -c /opt/frp/frps.ini