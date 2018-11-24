#!/bin/bash
#通过脚本修改内核参数以现在RS的ARP通告和应答级别
#如果启动则设置vip地址在lo：0
vip=192.168.43.99
netmast=255.255.255.255
case $1 in
    start)
            echo 1 > /proc/sys/net/ipv4/conf/all/arp_ignore
            echo 1 > /proc/sys/net/ipv4/conf/lo/arp_ignore
            echo 2 > /proc/sys/net/ipv4/conf/all/arp_announce
            echo 2 > /proc/sys/net/ipv4/conf/lo/arp_announce
        	ifconfig lo:0 $vip netmask $netmast broadcast $vip up 
		 route add -host $vip dev lo:0
            ;;
    stop)
            echo 0 > /proc/sys/net/ipv4/conf/all/arp_ignore
            echo 0 > /proc/sys/net/ipv4/conf/lo/arp_ignore
            echo 0 > /proc/sys/net/ipv4/conf/all/arp_announce
            echo 0 > /proc/sys/net/ipv4/conf/lo/arp_announce
	    ifconfig lo:0 del $vip
            ;;
    *)
            echo "Usage $(basename $0) start|stop"
            exit 1
            ;;
esac
