#!/bin/bash
USER=$1
if [[ -z "$USER" ]]; then
	echo Please pass user name as first argument.
	exit 0
fi

svn log -r "{2013-02-01}:HEAD" https://acx.corp.acxiom.net/svn/pmi_spice/WS | sed -n "/$USER/,/-----$/ p"
