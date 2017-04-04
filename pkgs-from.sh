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


# Get distrubiotion code name
codename=`lsb_release -c | awk '{ print $2 }'`

# To count the number of packages from a specific category
count=0

# Create a tmp file to save all packages names, available from the selected category (component)
tmp=`mktemp`

# Create the content of tmp
find /var/lib/apt/lists/ -maxdepth 1 -iname "*${codename}[_-]${1}*" -exec cat {} >> ${tmp}.new \;

# Do some clean-up
# It will improves or searching speed
grep "^Package:" ${tmp}.new | sort | uniq  | cut -d' ' -f2 > $tmp

# Print a simple description
>&2 echo -e "Listing all packages installed from: $1."

# Start searching troughout all installed packages
while read pkg;
do
 # If installed paackage is a part of selected component print out its name.
 status=`grep "^$pkg$" $tmp`
 if [ ! -z "$status" ] 
  then
 	echo $pkg
 	# Count number of packges within the component
 	((count+=1))
 fi
# Get a list of installed packages and feed them to while
done < <( dpkg -l | grep ^ii | cut -f3 -d ' ' | sed 's/:amd64//' )
 	
# Remove the tmp files
rm $tmp
rm ${tmp}.new

# Print a simple summery
>&2 echo "Number of packages found from "$1" category is:" $count

exit 0