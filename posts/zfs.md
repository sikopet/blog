ZFS
---

Overview

* refererred to as a filesystem but it's a comprehensive storage management (LVM, RAID)
* can't be included into the Linux kernel due to licence terms (although it's open source)
* ZFS secretly writes a GPT-style partition table and allocates all disks' space to its first partition
* organized around *copy-on-write* principle

Pool

* ~ volume group
* composed of virtual devices - raw storage (disks, partitions, SAN), mirror groups, RAID arrays

Adding disk

    zpool create mypool sdb
    zpool list
    zpool status
    
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

Snapshots

    touch /opt/mypool/myfs/file
    zfs snapshot mypool/myfs@friday
    rm /opt/mypool/myfs/file
    ls /opt/mypool/myfs/.zfs/snapshot/friday
    zfs rollback mypool/myfs@friday  # can only revert FS to its most recent snapshot

* copy-on-write brought to the user level (just as in LVM)
* per-filesystem not per-volume
* comptele identifier: `<filesystem>@<snapshot>`
* read-only
* not true filesystems however can be turned into one:

        zfs clone mypool/myfs@friday mypool/myfs_clone

Adding (five) disks

    zpool destroy mypool
    zpool create mybigpool raidz1 sdb sdc sdd    # raidz<parity>
    zpool add -f mybigpool mirror sde sdf
    zpool status mybigpool

* ZFS's RAID-Z ~ RAID 5

More

* ULSAH, ch. 8

Encrypted backups with snapshots (on external HDD)
-----------------------------------------------------

Setup external disk

    dd if=/dev/zero of=/dev/sdc bs=1M count=10
    zpool create extusb /dev/sdc
    zfs create extusb/backup
    encfs /extusb/backup/.encrypted /extusb/backup/decrypted

Unmount the disk

    fusermount -u /extusb/backup/decrypted  # encfs
    umount /extusb/backup                   # zfs
    umount /extusb                          # zfs root
    /etc/init.d/zfs-fuse stop

Mount the disk

    /etc/init.d/zfs-fuse restart
    encfs /extusb/backup/.encrypted /extusb/backup/decrypted

Rsync data

    #!/bin/bash
    
    # Make sure backups are ecnrypted via encFS.
    mount | grep /extusb/backup/decrypted > /dev/null
    EV=$?
    if [[ $EV -ne 0 ]]; then
            echo "Backups not running, because encrypted FS is not mounted. Run:"
            echo
            echo "    encfs /extusb/backup/.encrypted /extusb/backup/decrypted"
            exit 1
    fi
    
    # Rsync
    rsync --quiet --delete -az \
            remote.host.org:/data1 \
            remote.host.org:/data2 \
            /extusb/backup/decrypted/remote.host.org
    
    # Snapshot
    zfs snapshot extusb/backup@`date +%F`

Restore data

    zfs clone extusb/backup@2015-03-13 extusb/2015-03-13
    encfs /extusb/2015-03-13/.encrypted /extusb/2015-03-13/decrypted/
    #### take the files you need from /extusb/2015-03-13/decrypted/
    fusermount -u /extusb/2015-03-13/decrypted
    zfs destroy extusb/2015-03-13
