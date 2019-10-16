#!/bin/sh

# detach loop image if it was attached
sudo /sbin/losetup -d /dev/loop0

# use bximage to create floppy.img as a 1.44 MB floppy.
# recreate the floppy.img
#rm floppy.img
#mkfs.msdos -C floppy.img 1440

# create a loopback device called /dev/loop0 
# which is attached to the floppy.img file on the harddrive
sudo /sbin/losetup /dev/loop0 floppy.img

# mount the loopback device to the /mnt2 folder
sudo mount /dev/loop0 /mnt

# copy the kernel onto the mount point, aka into the loopback device, aka. into the file floopy.img
sudo cp src/kernel /mnt/kernel

# unmount the loopback device
sudo umount /dev/loop0

# detach the loopback device /dev/loop0 (from the file floppy.img)
sudo /sbin/losetup -d /dev/loop0
