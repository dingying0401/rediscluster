#! /usr/bin/expect -f
# set addresslist [lrange $argv 0 5]
# set timeout 30
spawn ./redis-trib.rb create --replicas 1 [lindex $argv 0] [lindex $argv 1] [lindex $argv 2] [lindex $argv 3] [lindex $argv 4] [lindex $argv 5]                
expect "Can I set the above configuration? (type 'yes' to accept):"
send "yes\r"
interact
