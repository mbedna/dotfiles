#!/bin/sh
curl -XGET 'http://localhost:9200/metadata/resource/_search?size=100000&pretty' -d '
{
    "query" : {
        "match_all" : {}
    }
}'
