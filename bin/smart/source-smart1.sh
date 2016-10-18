#!/bin/sh

if [ -f "${HOME}/.bash_profile_smart1" ]; then
  source "${HOME}/.bash_profile_smart1"
fi
echo $DATABASE_URI
