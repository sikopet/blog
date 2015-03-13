* refererred to as a filesystem but it's a comprehensive storage management (LVM, RAID)
* can't be included into the Linux kernel due to licence terms (although it's open source)
* ZFS secretly writes a GPT-style partition table and allocates all disks' space to its first partition

pool 
* ~ volume group
* composed of virtual devices - raw storage (disks, partitions, SAN), mirror groups, RAID arrays

RAID-Z ~ RAID 5


