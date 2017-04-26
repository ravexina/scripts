#!/bin/bash

# Author: ravexina 
# https://github.com/ravexina

# Synchronize cached writes to persistent storage
echo "start syncing..."
sync

# If no device defined as parameter ask for entering device name
# else set it as DEV
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

# Create a full device name (/dev/sdb)
DEV="/dev/$DEV"
# Create a partition name (/dev/sdb1)
PARTN='1'
PART=$DEV$PARTN

echo "Unmounting $PART"
udisksctl unmount -b $PART 2> /dev/null

sleep 1

echo "Powering off $DEV"
udisksctl power-off -b $DEV

exit 0
