#!/bin/bash

# ----------
# autostart
# ----------

monitor-hotplug.sh &
#xsetroot -solid "#555" &
feh --bg-fill /home/thomas/media/thomas-heaton-wild-camping.jpg
conky -c ~/.config/conky_desktop &
loginlock.sh &

xset -b &
xrdb -load .Xresources &
numlockx on &

compton &
dunst &
nm-applet &
pnmixer &
xfce4-volumed &
xfce4-power-manager &
xautolock -time 3 -locker "~/bin/blurlock2.sh"  &
clipit &
redshift-gtk &
dropbox start &
udiskie -s &

