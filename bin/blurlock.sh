#!/bin/bash
# blurs your screen instead of hiding everything
# depends on imagemagick convert and i3lock
# tostiheld 2015

scrot /tmp/screen.png

infile=/tmp/screen.png
outfile=/tmp/screen.png
# adjust blurriness here
size=16

w=$(convert $infile -format "%[fx:w]" info:)
h=$(convert $infile -format "%[fx:h]" info:)
minify=$(convert xc: -format "%[fx:100/$size]" info:)
convert $infile -resize $minify% -scale ${w}x${h}! $outfile

/usr/bin/i3lock -i /tmp/screen.png
