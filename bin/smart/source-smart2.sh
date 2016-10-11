#!/bin/sh

if [ -f "${HOME}/.bash_profile_smart2" ]; then
  source "${HOME}/.bash_profile_smart2"
fi
echo $DATABASE_URI
