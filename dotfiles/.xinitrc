#!/bin/sh
xset b off
setxkbmap -option ctrl:nocaps
xmodmap -e "clear Mod1"
xmodmap -e "keycode 64 = Escape"
ulimit -Sc 0
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Natural Scrolling Enabled" 1
hsetroot -fill /home/rookie/.img.jpg
export GTK_THEME=Adwaita:dark
picom --backend egl --vsync &
dunst &
slstatus &
unclutter -idle 3 -root &
exec dwm
