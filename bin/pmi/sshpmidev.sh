#!/usr/bin/expect -f

spawn ssh mbedna@pmzlap01.uk.acxiom.com
sleep 1
send -- "sudo su - pmidev\r"

interact
exit 0
