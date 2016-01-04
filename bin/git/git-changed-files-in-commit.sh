#!/bin/bash
if [ -z "$1" ]; then
    echo 'Script shows files changed in $1 sha commit. '
    echo 'Please pass sha commit as parameter.'
    exit 0
fi
git diff-tree --no-commit-id --name-only -r $1 
