#!/bin/bash

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == CYGWIN_NT* ]]; then
   platform='cygwin'
elif [[ "$unamestr" == Darwin* ]]; then
   platform='mac'
fi
