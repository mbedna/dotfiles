#!/bin/sh
cd $SMART
SBT_OPTS="$SBT_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4002,server=y,suspend=n"
sbt "project pro-serv-web-app" "run 9001"
