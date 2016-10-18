#!/bin/sh
if [ -f "${HOME}/.bash_profile_smart2" ]; then
  source "${HOME}/.bash_profile_smart2"
fi
cd $SMART/nuvo/nurofen
rake db:migrations:apply
