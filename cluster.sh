#!/bin/bash
#three external variables $REDIS_NUM $CLUSTERNAME $SUBDOMAIN
#cut redis num from hostname
num=`hostname | cut -d '-' -f 2`
count=0
#array for the ip list
list=()
addresslist=()
#catch ip list
x=`expr $REDIS_NUM - 1`
#echo $num $x
if [[ "$num" == "$x" ]];then
  #echo $num $x
  while [ "$count" -lt "$REDIS_NUM" ]
  do
    if [ "$count" != "$x" ];then
      IP=`ping $CLUSTERNAME-$count.$SUBDOMAIN -c 1 | grep 10.128 | grep -v 'PING' | cut -d ' ' -f 4 | cut -d ':' -f 1`
      echo $IP >> bash.log
    else
      IP=`ping $CLUSTERNAME-$count.$SUBDOMAIN -c 1 | grep 10.128 | grep -v 'PING' | cut -d ' ' -f 5 | cut -d '(' -f 2 | cut -d ')' -f 1`
      echo $IP >> bash.log
    fi
    #list=(${list[*]} $IP)
    address=$IP:6379
    addresslist=(${address[*]} $address)
    count=$[count+1]
  done
  nohup redis-server /etc/redis.conf &
else
  redis-server /etc/redis.conf
 #echo "failed"
fi
#print the ip list
echo ${list[*]} >> bash.log
#start creating the redis cluster
./redis-trib.rb create --replicas 1 ${addresslist[*]}
