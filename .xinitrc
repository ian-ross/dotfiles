#!/bin/bash

HOST=$(hostname)

echo PULLING ORG FILES...
cd ~/org
git pull
cd

xset b off
xrdb -merge ~/.Xresources
if [ ${HOST} == seneca ]
then
    setxkbmap gb -option compose:ralt
fi
if [ ${HOST} == epictetus ]
then
    setxkbmap us -option compose:ralt
fi
xmodmap ~/.Xmodmap
if [ ${HOST} == seneca ]
then
    xrandr --output HDMI1 --mode 1920x1080 --output HDMI2 --mode 1920x1080 --pos 1920x0
    MONITOR='--monitor 0'
    start-pulseaudio-x11

    xsetwacom --set "Wacom Intuos S 2 Pen stylus" MapToOutput "1920x1080+0+0"
    xbindkeys
    xsetwacom --set "Wacom Intuos S 2 Pad pad" "Button" "9" "key +Control_L "
    xsetwacom --set "Wacom Intuos S 2 Pad pad" "Button" "8" "key +Alt_L key Left key -Alt_L"
fi

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 5 --transparent true --tint 0x191970 --height 24 \
 $MONITOR &

xsetroot -cursor_name left_ptr
if [ ${HOST} == seneca ]
then
    background-image
    qiv --root_t ~/misc-doc/desktop-background.png
fi

eval $(ssh-agent)
if [ ${HOST} == seneca ]
then
    SpiderOakONE &
    easystroke hide &
    mpd
fi

st -e tmux &
st -e tmux &
nm-applet --sm-disable &
if [ ${HOST} == seneca ]
then
    emacs &
    chromium &
fi

exec xmonad
