#!/bin/bash
#
master () {
rpm -q keepalived &> /dev/null
if [ $? -ne 0 ];then 
	yum -y install keepalived && \cp ./keepalived.conf ./notify.sh /etc/keepalived/ && systemctl start keepalived.service
	else
	\cp ./keepalived.conf ./notify.sh /etc/keepalived/ && systemctl start keepalived.service
fi
}
backup () {
master 
sed -i "s@router_id node1@router_id node2@g" /etc/keepalived/keepalived.conf &> /dev/null
sed -i "s@state MASTER@state BACKUP@g" /etc/keepalived/keepalived.conf &> /dev/null
sed -i "s@priority 100@priority 96@g" /etc/keepalived/keepalived.conf &> /dev/null
systemctl start keepalived.service
}
case $1 in 
MASTER)
	master;;
BACKUP)
	backup;;
*)
	echo "you must write {MASTER|BACKUP}"
	;;
esac
