#!/bin/sh
xset b off
setxkbmap -option ctrl:nocaps
xmodmap -e "clear Mod1"
xmodmap -e "keycode 64 = Escape"
ulimit -Sc 0
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Natural Scrolling Enabled" 1
hsetroot -fill /home/rookie/.img.jpg
dunst &
picom --backend egl --vsync &
unclutter -idle 1 -root &
export GTK_THEME=Adwaita:dark
exec i3
