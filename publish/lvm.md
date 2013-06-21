# Logical Volume Manager (LVM)
###### linux

LVM -- implementation of [logical volume management](https://en.wikipedia.org/wiki/Logical_volume_management) in Linux

## Terminology

           hda1   sdc       (PVs on partitions or whole disks)
              \   /
               \ /
              diskvg        (VG)
              /  |  \
             /   |   \
         usrlv rootlv varlv (LVs)
           |      |     |
        ext2  reiserfs  xfs (filesystems)


* Physical volume (PV) -- partition (ex. `/dev/hda1`), disc (ex. `/dev/sdc`) or RAID device (ex. `/dev/md0`)
* Volume group (VG) -- group of physical volumes (ex. `diskvg`)
* Logical volume (LV) -- equivalent of standard partitions, where filesystems can be created (ex. `/usr`)

## Working with LVM

Creating Volumes

1. Creating PV (initialize disk)

        # pvcreate /dev/md0
        Physical volume "/dev/md0" successfully created

    Check the results with `pvdisplay`

1. Creating VG

        # vgcreate raid1vg /dev/md0
        Volume group "raid1vg" successfully created

    Check the results with `vgdisplay`

1. Creating LV

        # lvcreate --name backuplv --size 50G raid1vg
        Logical volume "backuplv" created

    Check the results with `lvdisplay`

1. Create filesystem

        # mkfs.ext3 /dev/raid1vg/backuplv

    Edit `/etc/fstab`

        # RAID 1 + LVM
        /dev/raid1vg/backuplv   /mnt/raid/backup        ext3    rw,noatime      0       0

    Create mount points and mount volumes

        # mkdir -p /mnt/raid/backup
        # mount -a

Extending LV

    # lvextend -L +5G /dev/raid1vg/varlv
    Extending logical volume varlv to 10,00 GB
    Logical volume varlv successfully resized
    
    # resize2fs /dev/raid1vg/varlv
    resize2fs 1.41.0 (10-Jul-2008)
    Filesystem at /dev/raid1vg/varlv is mounted on /mnt/raid/var; on-line resizing required
    old desc_blocks = 1, new_desc_blocks = 1
    Performing an on-line resize of /dev/raid1vg/varlv to 2621440 (4k) blocks.
    The filesystem on /dev/raid1vg/varlv is now 2621440 blocks long.

