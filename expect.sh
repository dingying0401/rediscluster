#! /usr/bin/expect -f
# set addresslist [lrange $argv 0 5]
spawn ./redis-trib.rb create --replicas 1 $argv                
expect "Can I set the above configuration? (type 'yes' to accept):"
send "yes\r"
interact
