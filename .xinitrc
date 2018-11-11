#!/bin/bash

xset b off
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
# start-pulseaudio-x11

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 5 --transparent true --tint 0x191970 --height 24 \
 $MONITOR &

xsetroot -cursor_name left_ptr
# background-image
# qiv --root_t ~/misc-doc/desktop-background.png

eval $(ssh-agent)
nm-applet --sm-disable &

# mpd

st &
st &
# emacs &
# chromium &

exec xmonad
