#!/bin/bash
#设置lvs-director的ip地址和内核参数
ifconfig ens33:0 192.168.43.99 netmask 255.255.255.255 broadcast 192.168.43.99 && sysctl -t net.ipv4.ip_forward=1
