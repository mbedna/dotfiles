#!/usr/bin/env bash
#
# Simple script killing all Java processes apart from Intelli and SQL Developer

ps aux | awk '{ if(match($11, /java/)) { print }}' | grep -v "Intelli\|sqldeveloper" | awk '{ print $2 }' | xargs kill

