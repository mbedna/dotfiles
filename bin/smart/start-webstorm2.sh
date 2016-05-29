#!/bin/sh
source ~/.bashrc
if [ -f "${HOME}/.bash_profile_smart2" ]; then
  source "${HOME}/.bash_profile_smart2"
fi
"/Applications/WebStorm.app/Contents/MacOS/webstorm"
