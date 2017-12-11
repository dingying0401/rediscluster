#! /usr/bin/expect                                                                                                                                                     
spawn ./cluster.sh                
expect "Can I set the above configuration? (type 'yes' to accept):“
send "yes\r"
interact
