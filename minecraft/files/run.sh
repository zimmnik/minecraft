#!/bin/ash
# shellcheck shell=dash

#set -o xtrace
set -o pipefail
set -o nounset
set -o errexit

#-----------------------------------------------------------------------------------------
# PROXY SETUP
#GW=$(ip r | grep default | head -1 | awk '{print $3}')
#GW=localhost
#export http_proxy=http://$GW:3128 && printenv | grep proxy
#sed -i "s/https/http/g" /etc/apk/repositories && cat /etc/apk/repositories
#time apk update #-----------------------------------------------------------------------------------------
# 
#mkdir /opt/minecraft && cd /opt/minecraft
#mv -v /tmp/* .

#https://www.minecraft.net/en-us/download/server
# 1.19.2
wget -q https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar

echo "eula=true" > eula.txt

#apk --no-cache add samba

#-----------------------------------------------------------------------------------------
# USERS
#id=10000
#adduser -D -u $id zorg
#adduser zorg users
#for NAME in masha media work; do
#  id=$((id+1))
#  adduser -D -H -s /sbin/nologin -u $id $NAME
#  adduser $NAME users
#  adduser zorg $NAME
#done
#adduser masha media
#
##-----------------------------------------------------------------------------------------
## SMB USERS
#while IFS= read -r line; do
#  LOGIN="${line%%:*}"
#  PASS="${line#*:}"
#  printf "$PASS\n$PASS\n" | smbpasswd -s -a $LOGIN
#done < /tmp/psw.txt
#rm -v /tmp/psw.txt

#-----------------------------------------------------------------------------------------
# DEBUG
#pdbedit -L
