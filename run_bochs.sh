#!/bin/bash

# run_bochs.sh
# mounts the correct loopback device, runs bochs, then unmounts.

sudo /sbin/losetup /dev/loop0 /home/wbi/dev/osdev/jamesmolloy/genesis/floppy.img
#sudo bochs -f bochsrc.txt
sudo /home/wbi/dev/bochs/bochs-20190421/bochs -f /home/wbi/dev/osdev/jamesmolloy/genesis/bochsrc.txt -q
sudo /sbin/losetup -d /dev/loop0
