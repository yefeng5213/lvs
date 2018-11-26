#!/bin/bash
#
yum -y install keepalived && cp ./keepalived.conf /etc/keepalived/keepalived.conf
sed -i "s@router_id node1@router_id node2@g" /etc/keepalived/keepalived.conf &> /dev/null
sed -i "s@state MASTER@state BACKUP@g" /etc/keepalived/keepalived.conf &> /dev/null
sed -i "s@priority 100@priority 96@g" /etc/keepalived/keepalived.conf &> /dev/null
systemctl start keepalived.service
