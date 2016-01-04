#!/usr/bin/env bash
#
# Oracle database starting script
# by Tomasz Janeczko 2013

pushd .

# cd to VMs directory
cd /opt/tools/OracleVM # ***CHANGE THIS PATH TO YOUR VMs VAGRANT FOLDER ***

# Start the VM
vagrant up
vagrant ssh <<EOF

# Start the db
sudo su - oracle
lsnrctl start

sqlplus / as sysdba
startup

exit
EOF

popd .
