#!/bin/sh
# program xev to check keys
# check remap-caps-escape-ubuntu.sh script
#Switch fn
#1. Run the following command to append the configuration line to the file /etc/modprobe.d/hid_apple.conf creating it if necessary:

echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
#2. Trigger copying the configuration into the initramfs bootfile.

sudo update-initramfs -u -k all
#3. Optionally, reboot

sudo reboot
