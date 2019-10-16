#!/bin/bash

#
# run_bochs.sh
#
# mounts the correct loopback device (mount the floppy that contains grub and the kernel), 
# runs bochs, then unmounts the floppy.
#

# assemble loopback device filename
# has to match with the content of bochsrc.txt
LOOPBACK_DEVICE=/dev/loop654321

echo "Mounting floppy as: "${LOOPBACK_DEVICE}

# mount the loopback device
sudo /sbin/losetup ${LOOPBACK_DEVICE} floppy.img

# start bochs including the debugger
#sudo /home/wbi/dev/bochs/bochs-20190421/bochs -f bochsrc.txt -q

# start bochs without the debugger
sudo /home/wbi/dev/bochs/bochs-20190421/bochs_nodebugger -f bochsrc.txt -q

# umount the floppy by deleting the loopback device
sudo /sbin/losetup -d ${LOOPBACK_DEVICE}
