#!/usr/bin/expect -f

spawn ssh mbedna@pmplap03.uk.acxiom.com

send -- "sudo su - pmidev\r"
interact
exit
