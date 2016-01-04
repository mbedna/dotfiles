#!/bin/sh
cd $SMART
SBT_OPTS="$SBT_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4001,server=y,suspend=n"
sbt "project nuvo-rest-api" "run 9002"
