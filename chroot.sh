#!/bin/bash

mount --type proc none /mnt/proc
mount --type sysfs none /mnt/sys
mount --bind /dev /mnt/dev
mount --bind /run /mnt/run
mount --bind /run/lvm /mnt/run/lvm

cp /etc/resolv.conf /mnt/etc/resolv.conf
