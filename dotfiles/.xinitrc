# .xinitrc

# Hardware
xset b off
setxkbmap -option ctrl:nocaps
xmodmap -e "clear Mod1"
xmodmap -e "keycode 64 = Escape"
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Natural Scrolling Enabled" 1

# Environment
ulimit -Sc 0
export GTK_THEME=Adwaita:dark
hsetroot -fill "/home/$USER/.img.jpg"

# Services
xcompmgr &
unclutter -idle 3 -root &

# Window Manager
exec cwm
