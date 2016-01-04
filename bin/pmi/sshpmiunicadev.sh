#!/usr/bin/expect -f

spawn ssh jczarn@pmzldb01.uk.acxiom.com
sleep 1
#send -- "sudo su - pmidev\r"

interact
exit 0
