#!/bin/sh
for i in $(docker images -q)
do
    docker history $i | grep -q $1 && echo $i
done | sort -u
