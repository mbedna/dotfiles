#!/bin/sh
svn status | grep '^!' | awk '{print $2}' | xargs svn delete
