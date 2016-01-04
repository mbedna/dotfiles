#!/bin/sh
cat ~/.ssh/id_rsa.pub | ssh defra-teamcity 'cat >> .ssh/authorized_keys'
