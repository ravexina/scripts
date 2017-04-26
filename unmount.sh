#!/bin/bash

# Author: ravexina 
# https://github.com/ravexina

# Usage: 
# 	Create a list of programs installed from a specific category
#
# Example: 
#       `pkgs-from universe` will list all packages from universe category (component)
#
# There may be some false detection in "backports" !!

# Licensed under the GNU General Public License v3.0 

#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.

#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
