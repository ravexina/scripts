#!/bin/bash

# Synchronize cached writes to persistent storage
echo "start syncing..."
sync

# If no device defined as parameter ask for entering device name
# else set it as DEV
if [ $# -eq 0 ]
  then
	echo "------------------"
#	lsblk | grep "sd[a-z] " | awk '{ print $1 " " $4}'
	lsblk -o kname,model,size | grep "sd[a-z][^0-9]"
	echo "------------------"
	echo "Enter device name: (sd[b-z])"
    	read DEV # ex: sdb
else
	DEV=$1 # ex: sdb
fi

# Create a full device name (/dev/sdb)
DEV="/dev/$DEV"

# Get the list of mounted partitions for device
PARTS=$(mount | grep "^${DEV}" | awk '{ print $1 }')

# Unmount monunted partitions
for PART in $PARTS;
do
 echo "Unmounting $PART"
 udisksctl unmount -b $PART 2> /dev/null
 sleep 1
done

sleep 1

echo "Powering off $DEV"
udisksctl power-off -b $DEV

exit 0
