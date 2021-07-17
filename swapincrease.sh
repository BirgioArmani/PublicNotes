#!/bin/bash

#This bit installs pv because sitting and looking at nothing sucks.

#apt-get install pv -y

# This shell script simply increases swap space to 30GB on gnu linux systems. May take a while to run. 

cd /var/
touch swapfile
chmod 600 swapfile
echo "Swap File inflating, may take a while. You will recieve a notification when complete."
dd if=/dev/zero of=/var/swapfile bs=1024k count=30000
mkswap /var/swapfile
swapon /var/swapfile
echo "Complete! Verify updated swap."
