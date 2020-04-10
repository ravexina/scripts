# Scripts
Simple scripts in different langages to handle basic day to day functions.

---

# List of scripts

- dtagsearch.sh
    - search for specific docker image tags

          $ dtagsearch.sh debian
          bullseye-20200224
          unstable-20200130-slim
          unstable-20200130
          testing-20200130-slim
          testing-20200130
          stretch-20200130-slim
          ...
          
- dimgsize.sh
    - Returns a docker image size able of looking for specific tag
    
          $ dimgsize.sh debian buster-20200224
          49Mi


- fix-str.sh
    - Fix subtitle files encoding problem -> convert to utf-8
    - Script contains commented usecase.

- pkgs-from.sh
    - Creates a list of packages installed from a specific category
        `pkgs-from.sh universe`

- unmount.sh
    - Safely unmont and poweroff an external drive
        - unmounts all partitions first then poweroff the block device
        `unmount.sh sdx`

- gjc.py
    - Converts Gregorian & Jalali
        `gjc.py 2020/04/10`

- now_playing_clementine.py
    - Shows the details of currently playing track in Clementine music player
    - .:: ♪♪♪ ::..

- vimcat
        - vimcat from vim, to cat files in a colorful way

- today.sh
    - Prints out the persian day of the week

---

# Mirrors

This repository is available both at github and gitlab:

- https://gitlab.com/ravexina/scripts
- https://github.com/ravexina/scripts
