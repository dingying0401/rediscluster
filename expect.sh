#! /usr/bin/expect                                                                                                                                                     
spawn ./redis-trib.rb create --replicas 1 ${addresslist[*]}                
expect "Can I set the above configuration? (type 'yes' to accept):"
send "yes\r"
interact
