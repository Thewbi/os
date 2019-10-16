#!/bin/bash

# 
# update_image.sh
#
# The purpose of this script is to write a kernel file from the src folder into the floppy.img file.
# To copy the kernel, the floppy image is first mounted into a so called loopback device.
# The loopback is first created, then the existing floppy.img it is mounted into the loopback device
# Then the kernel is copied into the mounted device, which actually writes it into the floppy.img file.
# After that the floppy is unmounted and the loopback device is destroyed.
#
# Because ubuntu already has a bunch of loopback devices, a function is called that determines the 
# highest index amongst all existing loopback devices. The highest index is incremented to retrieve
# a free loopback device.
# 

source "common_script.sh"

# call the function to retrieve the largest loopback device
LARGEST_INDEX=$(retrieveLargestLoopbackIndex)

#echo "LARGEST_INDEX:"${LARGEST_INDEX}

# increment index
((NEXT_INDEX=LARGEST_INDEX+1))

#echo "NEXT_INDEX:"${NEXT_INDEX}

# detach loop image if it was attached
#sudo /sbin/losetup -d /dev/loop0

# use bximage to create floppy.img as a 1.44 MB floppy.
# recreate the floppy.img
#rm floppy.img
#mkfs.msdos -C floppy.img 1440

# assemble loopback device filename
LOOPBACK_DEVICE=/dev/loop${NEXT_INDEX}

# create a loopback device called /dev/loop0 
# which is attached to the floppy.img file on the harddrive
sudo /sbin/losetup ${LOOPBACK_DEVICE} floppy.img

# mount the loopback device to the /mnt2 folder
sudo mount ${LOOPBACK_DEVICE} /mnt

# copy the kernel onto the mount point, aka into the loopback device, aka. into the file floopy.img
sudo cp src/kernel /mnt/kernel

# unmount the loopback device
sudo umount ${LOOPBACK_DEVICE}

# detach the loopback device /dev/loop0 (from the file floppy.img)
sudo /sbin/losetup -d ${LOOPBACK_DEVICE}
