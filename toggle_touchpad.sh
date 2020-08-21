#!/bin/sh

if [ "$(xinput list-props 12 | grep "Device Enabled" | awk '{print $4}')" = "0" ]
then
    xinput set-prop 12 "Device Enabled" 1
    notify-send Touchpad Enabled!
else
    xinput set-prop 12 "Device Enabled" 0
    notify-send Touchpad Disabled!
fi
