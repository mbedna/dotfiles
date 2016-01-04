#!/bin/bash
 
# Change these settings to match what you are wanting to do
FILE=/opt/projects/capd-hippo-cms-app/scripts/createHippoSchema.sh
SERVER=localhost
PATH=/tmp
 
OPTIONS=`vagrant ssh-config | awk -v ORS=' ' '{print "-o " $1 "=" $2}'`
 
scp ${OPTIONS} $FILE vagrant@$SERVER:$PATH
