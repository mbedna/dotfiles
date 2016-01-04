#!/bin/bash
host='localhost'
if [[ $1 = 'remote' ]]; then
    host='dr-det-mm'
fi
command="curl -XGET \"http://$host:9200/metadata/_mapping?pretty=true\""
eval $command
echo -e "\n"$command
