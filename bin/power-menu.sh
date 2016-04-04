#!/bin/bash

rofi_command="rofi -width 10 -hide-scrollbar -bg #586e75 -opacity 100 -padding 5 -dmenu"

options=$'poweroff\nreboot\nlogout\nhibernate\nsuspend'

choice=$(echo "$options" | $rofi_command -p "")

case "$choice" in
	poweroff)
		systemctl poweroff
		;;
	reboot)
		systemctl reboot
		;;
	logout)
		i3-msg exit
		;;
	hibernate)
		pm-hibernate
		;;
	suspend)
		pm-suspend
		;;
esac

