#!/bin/sh
if [ -f "${HOME}/.bash_profile_smart1" ]; then
  source "${HOME}/.bash_profile_smart1"
fi
cd $SMART
SBT_OPTS="$SBT_OPTS -Xdebug -Xnoagent -Dorg.xml.sax.driver=com.sun.org.apache.xerces.internal.parsers.SAXParser -Dhttp.netty.maxHeaderSize=16384 -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4001,server=y,suspend=n"
sbt "project nuvo-rest-api" "run 9002"
