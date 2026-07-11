# .xinitrc

xset b off
setxkbmap -option ctrl:nocaps
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Tapping Enabled" 1 2>/dev/null
xinput set-prop "DELL096A:00 04F3:30C4 Touchpad" "libinput Natural Scrolling Enabled" 1 2>/dev/null

ulimit -Sc 0
export GTK_THEME=Adwaita:dark

hsetroot -fill "$HOME/.img.jpg"
xcompmgr &
unclutter -idle 3 -root &

exec cwm
