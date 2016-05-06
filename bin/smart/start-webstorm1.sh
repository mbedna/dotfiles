#!/bin/sh
source ~/.bashrc
if [ -f "${HOME}/.bash_profile_smart1" ]; then
  source "${HOME}/.bash_profile_smart1"
fi
"/Applications/WebStorm.app/Contents/MacOS/webstorm"
