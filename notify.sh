#!/bin/bash
#keepalived邮件通知脚本
#date：2018-8-26
rpm -q sendmail
if [ $? -ne 0 ];then
   	yum -y install sendmail mailx &> /dev/null
	else
	ehco "sendmail is exist"$> /dev/null
fi
contact='root@localhost'
notify () {
	local mailsubject="$(hostname) to be $1 vip floating"
	local mailbody="$(date +'%F%T'):vrrp transition,$(hostname) changed to be $1"
	echo "$mailbody" | mail -s "$mailsubject" $contact
}

case $1 in 
master)
	notify master
	;;
backup)
	notify backup
	;;
fault)
	notify fault
	;;
*)
	echo "Usage:$(basename $0) {master|backup|fault}"
	exit 1
	;;
esac
