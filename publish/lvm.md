# Logical Volume Manager
###### linux

Terminology

* Physical volume (PV) -- partition (ex. `/dev/hda1`), disc (ex. `/dev/sdc`) or RAID device (ex. `/dev/md0`)
* Volume group (VG) -- group of physical volumes (ex. `diskvg`)
* Logical volume (LV) -- equivalent of standard partitions, where filesystems can be created (ex. `/usr`)

           hda1   sdc       (PVs on partitions or whole disks)
              \   /
               \ /
              diskvg        (VG)
              /  |  \
             /   |   \
         usrlv rootlv varlv (LVs)
           |      |     |
        ext2  reiserfs  xfs (filesystems)

