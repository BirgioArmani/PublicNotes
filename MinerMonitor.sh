#!/usr/bin/env bash

#Simple bash script that scans a file for a string, if the string is present, kills the machine. 
#This was originally used for catching GPU errors on virtualized miners.
#The purpose was to force reboot the miner vm prior to the hyporvisor crashing but uh, didn't work.
#Script worked, concept didn't. So here it is!

#This contains bashisms so, beware.

while true; do
        
        #Replace /tmp/yorufile.whatever with the file you want to tail for the string
        #/var/log/kern.log
        #/var/log/messages
        #touch tmp/yomama.txt whatever.
        [[ `tail -1 /tmp/yourfile.whatever | grep "The string u want to look for" | wc -l` != 0 ]] && echo b > /proc/sysrq-trigger #|| echo "Debug Text"

        #Sleep for 1 sec to ensure no major lag is caused by this script.
        sleep 1

        #In the case Miner dies, but the gpu does not, this kills this script.
        #Keeps from an infinite monitor script situation.
        #Replace MinerProcessName with self explanitory, htop, foo.
        [[ `ps aux | grep "MinerProcessName" | grep -v grep | wc -l` = 0 ]] && echo "No Miner processes are running." && break

done
