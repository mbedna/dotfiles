#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo 'Script deletes branch passed as parameter. '
    echo 'Please pass repo name in parameter.'
    exit 0
fi

repo_name=$1

git branch -d $repo_name
