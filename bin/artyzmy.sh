#!/bin/bash
declare -a months
months=( 31 28 31 30 31 30 31 31 30 31 30 31)
#author=m.bednarek@kainos.com
author=paws77@gmail.com
year=`date '+%Y'`
month=`date '+%m'`
day=`date '+%d'`
monthIndex=$month

if [ $monthIndex -lt '10' ]; then
    monthIndex=$(echo $monthIndex | sed 's/^0*//')
fi

startDate=$year'-'$month'-01'
endDateFile=$year'-'$month'-'${months[$monthIndex - 1]}
endDate=$year'-'$month'-'${months[$monthIndex - 1]}'T23:59:59+01:00'

currentDir=`pwd`
mkdir -p $currentDir/workLogs
logName=$currentDir/workLogs/worklog-$author-$startDate-$endDateFile.log
`echo '' > $logName`
for repo in `ls -d /smart1/*/ | egrep -v 'capd-project'`
do
    echo $repo
        
    cd $repo
        `git log -p --author=$author --since=$startDate --until=$endDate --branches | cat >> $logName`
    cd ..
done

echo 'Wrote to file '$logName
