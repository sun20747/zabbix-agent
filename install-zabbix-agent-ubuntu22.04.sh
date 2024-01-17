#!/bin/bash
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb -P /tmp/
dpkg -i /tmp/zabbix-release_6.4-1+ubuntu22.04_all.deb
apt update -y

apt install zabbix-agent2 zabbix-agent2-plugin-*

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/# ListenPort=10050/ListenPort=10050/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/# Hostname=/Hostname='"${host}"'/g' /etc/zabbix/zabbix_agent2.conf
systemctl restart zabbix-agent2
systemctl enable zabbix-agent2
