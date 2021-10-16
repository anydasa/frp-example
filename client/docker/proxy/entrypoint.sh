#!/bin/sh

checkRequiredEnvironmentVariable() {
  RED='\033[0;31m'

  if [[ -z $(printenv $1) ]]; then
    printf "${RED}ERROR: $1 required\n" >> /dev/stderr
    exit 100
  fi
}

checkRequiredEnvironmentVariable "SERVER_HOST"
checkRequiredEnvironmentVariable "SERVER_PORT"
checkRequiredEnvironmentVariable "SERVER_TOKEN"
checkRequiredEnvironmentVariable "PERSONAL_ALIAS"

sed -i "s|{SERVER_HOST}|$SERVER_HOST|g"         /opt/frp/frpc.ini
sed -i "s|{SERVER_PORT}|$SERVER_PORT|g"         /opt/frp/frpc.ini
sed -i "s|{SERVER_TOKEN}|$SERVER_TOKEN|g"       /opt/frp/frpc.ini
sed -i "s|{PERSONAL_ALIAS}|$PERSONAL_ALIAS|g"   /opt/frp/frpc.ini

/opt/frp/frpc -c /opt/frp/frpc.ini