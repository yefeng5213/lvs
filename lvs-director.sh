#!/bin/bash
#设置lvs-director的ip地址和内核参数
vip=192.168.43.99
nk=255.255.255.255
ifconfig | grep "ens33:0" &> /dev/null
if [ $? -ne 0 ];then 
	ifconfig ens33:0 192.168.43.99 netmask 255.255.255.255 broadcast 192.168.43.99 && sysctl -w net.ipv4.ip_forward=1
	else 
	exit 1
	echo "ens33:0 already exist"
fi
