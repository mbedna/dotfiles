#!/bin/sh
branchName = $1
commit = $2
git checkout -b $branchName $commit
