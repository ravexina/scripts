#!/bin/bash     

# Author: ravexina
# https://gitlab.com/ravexina

# this script prints the name of day in the week.
# depends on: libfribidi-bin 

# A simple list of days
d[1]="دوشنبه"
d[2]="سه‌شنبه"
d[3]="چهار‌شنبه"
d[4]="پنجشنبه"
d[5]="جمعه"
d[6]="شنبه"
d[7]="یک‌شنبه"


# Get the day number in the week.
day=`date +%u` # returns 1 between 7, 1 is monday.

# print out the day name
# pipe it to fribidi to make it rtl
echo ${d[$day]} 
