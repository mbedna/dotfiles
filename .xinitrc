#!/bin/sh
#Use .gnomerc for Ubuntu
setxkbmap -option caps:escape
xrdb -load ~/.Xresources
#This file does not work on 14.04. Us script which starts with remap from bin directory.
