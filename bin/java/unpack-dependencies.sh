#!/bin/bash

classpath=$(cat .classpath_unix)

dirname=${PWD##*/}

mkdir -p /opt/tools/sources/$dirname

IFS=':'

for i in $classpath
do
    if [[ "$i" == *jar ]]
    then
        source=$(echo $i | rev | cut -c 5- | rev)
        source=$source"-sources.jar"
        source=$(echo $source | sed 's/jars/srcs/g')
        source=$(echo $source | sed 's/bundles/srcs/g')
        echo $source
        cp $source /opt/tools/sources/$dirname
        unzip -o /opt/tools/sources/$dirname/$(basename $source) -d /opt/tools/sources/$dirname
    fi
done
rm -rf /opt/tools/sources/$dirname/*.jar
cd /opt/tools/sources/$dirname
ctags -R .
