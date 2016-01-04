#!/bin/sh
kill -9 `lsof -i :8900 | awk '{print $2}' | tail -n +2 | uniq`
