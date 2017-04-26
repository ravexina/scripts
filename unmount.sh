#!/bin/bash

# Author: ravexina
# https://gitlab.com/ravexina

# gives a simple and fast cli interface to
# unmount and power-off drives.

# Writes caches to persistent storage.
echo "start syncing..."
sync

# If no device defined as a parameter, ask for entering a device name.
# otherwise set provided device done.
if [ $# -eq 0 ]
  then
	echo "------------------"
	lsblk | grep "sd[b-z] " | awk '{ print $1 " " $4}'
	echo "------------------"
	echo "Enter device name: (sd[b-z])"
    	read DEV # ex: sdb
  else
	DEV=$1 # ex: sdb
fi

# Create the drive full path (/dev/sdb)
DEV="/dev/$DEV"
# Create the partition full path (/dev/sdb1)
PARTN='1'
PART=$DEV$PARTN

echo "Unmounting $PART"
udisksctl unmount -b $PART

echo "Powering off $DEV"
udisksctl power-off -b $DEV

exit 0