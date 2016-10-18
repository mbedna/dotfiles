#!/bin/sh
if [ -f "${HOME}/.bash_profile_smart1" ]; then
  source "${HOME}/.bash_profile_smart1"
fi
cd $SMART/nuvo/nurofen
rake db:migrations:apply
