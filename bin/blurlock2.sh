#!/bin/bash

revert() {
	xset dpms 0 0 0
}

trap revert SIGHUP SIGINT SIGTERM
xset dpms 5 5 5

image_file=/tmp/screen_lock.png
resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')
filters='noise=alls=10,scale=iw*.03125:-1,scale=iw*32:-1:flags=neighbor' 
ffmpeg -y -loglevel 0 -s "$resolution" -f x11grab -i $DISPLAY -vframes 1 \
	  -vf "$filters" "$image_file"
i3lock -n -f -e -i "$image_file"

revert

