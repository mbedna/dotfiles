#!/bin/bash

xset dpms 0 0 0
#This *should* turn off the dpms power management stuff
xset -dpms 
#This turns off the screen saver
xset s off 
#This should turn off screen blanking
xset s noblank 
echo 'screensaver turned off'
