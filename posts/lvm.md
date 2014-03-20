# Logical Volume Manager (LVM)

LVM is the implementation of [logical volume management](https://en.wikipedia.org/wiki/Logical_volume_management) in Linux. As I don't use it on a day-to-day basis, I created this blog in case I forgot the basics :-).

## Terminology

           sda1   sdc       (PVs on partitions or whole disks)
              \   /
               \ /
              diskvg        (VG)
              /  |  \
             /   |   \
         usrlv rootlv varlv (LVs)
           |      |     |
        ext4  reiserfs  xfs (filesystems)


* Physical volume (PV) -- partition (ex. `/dev/sda1`), disk (ex. `/dev/sdc`) or RAID device (ex. `/dev/md0`)
* Volume group (VG) -- group of physical volumes (ex. `diskvg`)
* Logical volume (LV) -- equivalent of standard partitions, where filesystems can be created (ex. `/usrlv`)

## Working with LVM

Creating Volumes

1. Create PV (initialize disk)

        pvcreate /dev/md0

    Check the results with `pvdisplay`

1. Create VG

        vgcreate raid1vg /dev/md0

    Check the results with `vgdisplay`

1. Create LV

        lvcreate --name backuplv --size 50G raid1vg

    Check the results with `lvdisplay`

1. Create filesystem

        mkfs.ext3 /dev/raid1vg/backuplv

1. Edit `/etc/fstab`

        # RAID 1 + LVM
        /dev/raid1vg/backuplv   /backup        ext3    rw,noatime      0       0

1. Create mount point and mount volume(s)

        mkdir -p /backup
        mount -a

Extending LV

1. Extend the LV
    
        lvextend -L +5G /dev/raid1vg/backuplv
    
1. Re-size the filesystem (online re-sizing doesn't seem to cause troubles)
    
        resize2fs /dev/raid1vg/backuplv
