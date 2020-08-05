#!/bin/bash

# This shell script simply increases swap space to 30GB on gnu linux systems. May take a while to run. 

cd /var/
touch swapfile
chmod 600 swapfile
dd if=/dev/zero of=/var/swapfile bs=1024k count=30000
mkswap /var/swapfile
swapon /var/swapfile
