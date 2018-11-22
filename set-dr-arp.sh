#!/bin/bash
#通过脚本修改内核参数以现在RS的ARP通告和应答级别
case $1 in
    start)
            echo 1 > /proc/sys/net/ipv4/conf/all/arp_ignore
            echo 1 > /proc/sys/net/ipv4/conf/lo/arp_ignore
            echo 2 > /proc/sys/net/ipv4/conf/all/arp_announce
            echo 2 > /proc/sys/net/ipv4/conf/lo/arp_announce
            ;;
    stop)
            echo 0 > /proc/sys/net/ipv4/conf/all/arp_ignore
            echo 0 > /proc/sys/net/ipv4/conf/lo/arp_ignore
            echo 0 > /proc/sys/net/ipv4/conf/all/arp_announce
            echo 0 > /proc/sys/net/ipv4/conf/lo/arp_announce
            ;;
    *)
            echo "Usage $(basename $0) start|stop"
            exit 1
            ;;
    esac
