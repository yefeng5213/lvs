#!/bin/bash 
#
vip=192.168.43.99
netmask=255.255.255.255
ifconfig lo:0 | grep init &> /dev/null
if [ $? -eq 1 ];then 
	ifconfig lo:0 $vip netmask $netmask broadcast $vip up && route add -host $vip dev lo:0 
	else 
		exit 0
	fi

