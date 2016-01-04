#!/bin/sh

yavdb -s pmi -t jdb "jdb -sourcepath $2 -connect com.sun.jdi.SocketAttach:hostname=localhost,port=8080"

echo "<enter to quit>"
read dummy
