#!/bin/sh

# Cat to remove colors from nmcli output
if [ $(nmcli radio wifi | cat) = 'enabled' ]
then
    nmcli radio wifi off
    notify-send WIFI disabled
else
    nmcli radio wifi on
    notify-send WIFI enabled
fi
