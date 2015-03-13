* refererred to as a filesystem but it's a comprehensive storage management (LVM, RAID)
* can't be included into the Linux kernel due to licence terms (although it's open source)
* ZFS secretly writes a GPT-style partition table and allocates all disks' space to its first partition

pool 
* ~ volume group
* composed of virtual devices - raw storage (disks, partitions, SAN), mirror groups, RAID arrays

RAID-Z ~ RAID 5

Adding disk

    zpool create mypool sdb
    
* disk was labeled
* `mypool` pool was created
* filesystem root inside `mypool` was created
* filesystem was mounted as `/mypool` (will be remounted automatically on (re)boot)

Filesystems

    zfs create mypool/myfs
    zfs list -r mypool    # -r -- recurse through child filesystems

* all filesystems living in a pool can draw from pool's available space
* unlike traditional filesystems which are independent of each other, hierarchically dependent (property inheritance)
* automounted as soon as created

Change default mount point (a property) of the root filesystem

    zfs set mountpoint=/opt/mypool mypool
    zfs get all mypool/myfs    # filesystem properties





More

* ULSAH, ch. 8
