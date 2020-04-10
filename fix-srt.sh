#!/bin/bash

# Author: ravexina
# https://github.com/ravexina
# https://gitlab.com/ravexina

# We can use this script in file managers custome actions, etc.
# For example in thunar: fix-srt.sh %f %n
# %f Will pass the selected file path as a first argument.
# %n Will pass the selected file name (for creating the fixed one).

# Setting the file path and file name.
file=$1
name=$2

# Finding out the encoding of the selected file.
encode=$(file -i "$file" | grep -o 'set=.*' | cut -d = -f 2 | tr "[:lower:]" "[:upper:]")

# A temperory var to checking the file encoding.
tmp=$(echo $encode | cut -d - -f 1)

# If encoding was unknown consider it as windows-1256.
if [ "$tmp" == "UNKNOWN" ]
then
	encode="WINDOWS-1256"
fi

# Create a new file with utf-8 encoding with the 
# `new-` prefix and same file name.
iconv -c -f $encode -t UTF-8 "$file" -o new-"$name"
