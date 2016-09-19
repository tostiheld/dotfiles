#!/bin/bash

# toggle touchpad with xinput
# tostiheld 2016

if [ -z $(which xinput) ]; then
	echo "This script depends on xinput"
	exit 1
fi

DEVICE_ID_STRING=($(xinput list | grep -i "touchpad"))
DEVICE_ID_STRING=${DEVICE_ID_STRING[6]}
DEVICE_ID=${DEVICE_ID_STRING:3:2}

DEVICE_ENABLED_STRING=$(xinput list-props $DEVICE_ID | grep "Device Enabled")

if [ -z "$DEVICE_ENABLED_STRING" ]; then
	echo "Invalid device id (or trouble getting device state)"
	exit 1
fi

DEVICE_ENABLED_INDEX=$(expr index "$DEVICE_ENABLED_STRING" :\t)
DEVICE_ENABLED_INDEX=$(($DEVICE_ENABLED_INDEX+1))

DEVICE_ENABLED=${DEVICE_ENABLED_STRING:$DEVICE_ENABLED_INDEX:1}

if [ $DEVICE_ENABLED -eq "1" ]; then
	xinput disable $DEVICE_ID
else
	xinput enable $DEVICE_ID
fi

exit 0
