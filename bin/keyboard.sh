#!/bin/bash
 
address="04:DB:56:D6:44:60"
 
while (sleep 1)
do
 connected=`sudo hidd --show` > /dev/null
 if [[ ! $connected =~ .*${address}.* ]] ; then
  sudo hidd --connect ${address} > /dev/null 2>&1
 fi
done
