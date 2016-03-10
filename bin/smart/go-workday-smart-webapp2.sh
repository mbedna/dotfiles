#!/bin/sh
cd $SMART
#export SBT_OPTS="$SBT_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4000,server=y,suspend=n"
SBT_OPTS="$SBT_OPTS -Xdebug -Xnoagent -Dhttp.netty.maxHeaderSize=16384 -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4000,server=y,suspend=n"
sbt "project workday-smart-webapp" "run 9000"
