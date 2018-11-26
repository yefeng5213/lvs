#!/bin/bash
#
master () {
rpm -q keepalived &> /dev/null
if [ $? -ne 0 ];then 
	echo "keepalived installing ..."
	yum -y install keepalived &> /dev/null && \cp ./keepalived.conf ./notify.sh /etc/keepalived/ && systemctl start keepalived.service &> /dev/null 
	echo "keepalived installd OK"
	else
	echo "keepalived is existed"
	\cp ./keepalived.conf ./notify.sh /etc/keepalived/ && systemctl start keepalived.service &> /dev/null
fi
yum -y install ipvsadm &> /dev/null
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
	master MASTER
	;;
BACKUP)
	backup BACKUP
	;;
*)
	echo "you must write {MASTER|BACKUP}"
	;;
esac
