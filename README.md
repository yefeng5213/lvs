# lvs-dr
lvs-dr模式中通过脚本修改内核参数以现在RS的ARP通告和应答级别;
lvs-director.sh 设置director的vip地址；
set-dr-arp.sh 设置rs的rip地址和内核参数；
set-keepalived MASTER : 设置主节点的keepalived；
set-keepalived BACKUP ： 设置从节点的keepalived；
keepalived.conf 为keepalived主配置文件
notify.sh 是通知脚本
这只是一个测试脚本！
