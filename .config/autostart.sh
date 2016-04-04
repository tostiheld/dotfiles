#!/bin/bash

# ----------
# autostart
# ----------

compton &
xsetroot -solid "#555" &
xset -b &
xrdb -load .Xresources &

ssh-agent &
nm-applet &
pnmixer &
xfce4-volumed &
xfce4-power-manager &
xautolock -time 3 -locker "~/bin/blurlock.sh"  &
clipit &
redshift-gtk &
dropbox start &
indicator-kdeconnect &
udiskie -s &
conky -c ~/.config/conky_desktop &

