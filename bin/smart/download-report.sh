#!/bin/sh
cd $SMART
#sbt "project custom-reports" "runMain DownloadReports kainossmart-intsysuser %password% https://i-428cdf98.workdaysuv.com/ccx/service super"
sbt "project custom-reports" "runMain DownloadReports kainossmart-intsysuser %password% https://i-428cdf98.workdaysuv.com/ccx/service super \"KainosSmart Worker Data\""
