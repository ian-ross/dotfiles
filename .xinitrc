#!/bin/bash

source ~/.bashrc

xset b off
xrdb -merge ~/.Xresources
setxkbmap gb -option compose:ralt
xmodmap ~/.Xmodmap
if [ $(hostname) == seneca ]
then
    xrandr --output HDMI1 --mode 1920x1080 --output HDMI2 --mode 1920x1080 --pos 1920x0
    MONITOR='--monitor 0'
fi
start-pulseaudio-x11

# # Start GNOME Keyring
# eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# export SSH_AUTH_SOCK
# export GPG_AGENT_INFO
# export GNOME_KEYRING_CONTROL
# export GNOME_KEYRING_PID

xsetwacom --set "Wacom Intuos S 2 Pen stylus" MapToOutput "1920x1080+0+0"
xbindkeys
xsetwacom --set "Wacom Intuos S 2 Pad pad" "Button" "9" "key +Control_L "
xsetwacom --set "Wacom Intuos S 2 Pad pad" "Button" "8" "key +Alt_L key Left key -Alt_L"

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 5 --transparent true --tint 0x191970 --height 24 \
 $MONITOR &

xsetroot -cursor_name left_ptr
background-image
qiv --root_t ~/misc-doc/desktop-background.png

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
SpiderOakONE &
easystroke hide &

if [ $(hostname) == seneca ]
then
    mpd
fi

lilyterm &
lilyterm &
emacs &
chromium &
nm-applet --sm-disable &

exec xmonad
