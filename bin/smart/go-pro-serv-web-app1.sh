#!/bin/sh
if [ -f "${HOME}/.bash_profile_smart1" ]; then
  source "${HOME}/.bash_profile_smart1"
fi
cd $SMART
SBT_OPTS="$SBT_OPTS -Xdebug -Xnoagent -Dhttp.netty.maxHeaderSize=16384 -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4002,server=y,suspend=n"
sbt "project pro-serv-web-app" "run 9001"
