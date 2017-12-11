#! /usr/bin/expect                                                                                                                                                     
spawn ./cluster.rb                
expect "Can I set the above configuration? (type 'yes' to accept):“
send "yes\r"
interact
