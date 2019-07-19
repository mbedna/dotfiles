#!/bin/sh
#Use .gnomerc for Ubuntu
setxkbmap -option caps:escape
xrdb -load ~/.Xresources
xset s off
xset -dpms
xset s noblank
#wyłącznie screensavera
#This file does not work on 14.04. Us script which starts with remap from bin directory.
