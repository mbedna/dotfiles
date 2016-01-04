#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo 'Script creates repo passes as parameter in github. '
    echo 'Please pass repo name in parameter.'
    exit 0
fi

repo_name=$1

usage="$(basename "$0") repo_name username -- Create a GitHub Repository"

if [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then
echo "$usage"
  exit
fi

curl -u $2 https://api.github.com/user/repos -d" {\"name\":\"$repo_name\"}"

git init
git remote add origin "https://github.com/$2/$repo_name.git"
