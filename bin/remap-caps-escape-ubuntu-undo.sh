#!/bin/sh
#Finally, after much research here's what I found for ubuntu 13.10:
#
#$ sudo apt-get install dconf-tools
#$ dconf-editor
#navigate to org >> gnome >> desktop >> input-sources
#
#Put your options under xkb-options as a list. Ex: ['altwin:ctrl_alt_win','..etc..']

#man 7 xkeyboard-config

#caps:escape              Make Caps Lock an additional ESC 
#altwin:ctrl_alt_win    Ctrl is mapped to Alt keys, Alt is mapped to Win keys
#ctrl:lctrl_meta   Left Ctrl as Meta

#dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape','lv3:rwin_switch', 'altwin:ctrl_alt_win']"

dconf write /org/gnome/desktop/input-sources/xkb-options "['']"

# After this for left Alt disable or remap to left Alt + left Win HUD
# gsettings set org.compiz.integrated show-hud "['<Alt><Super>']"
