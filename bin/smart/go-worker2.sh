#!/bin/sh
if [ -f "${HOME}/.bash_profile_smart2" ]; then
  source "${HOME}/.bash_profile_smart2"
fi
cd $SMART
SBT_OPTS="$SBT_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4003,server=y,suspend=n"
#sbt "project worker" "run 9003" -Dconfig.resource=akka-kernel.conf
# if issue branch.name then:
#WORKER LOCALLY

sbt "project worker" "dist:clean" "dist" && ./deployment-package/worker-dist/bin/start

#sbt "project worker" "dist:clean" "dist"
#./deployment-package/worker-dist/bin/start
#sbt "project worker" run
#
#comment out two lines in TestActor to allow it to work that way though
#the lines about commit sha and branch as it fails to lookup the env variables
#replace them with any string
#sbt "project worker" dist && ./deployment-package/worker-dist/bin/start
#sbt -jvm-debug 5005 "project worker" "run-main com.kainossmart.worker.standalone.WorkerApp"
#sbt -jvm-debug 5005 to debug
