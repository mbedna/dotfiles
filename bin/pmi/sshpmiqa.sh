#!/usr/bin/expect -f

spawn ssh mbedna@pmqlapv03.uk.acxiom.com

send -- "sudo su - pmidev\r"
interact
exit
