#!/bin/sh
 
sbt "project workday-smart-testframework-bps" "set testNGSuites := Seq("workday-smart-testframework-bps/src/test/resources/webcontrols-test-testng.xml")" "test"

