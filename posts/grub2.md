GRUB 2 vs. GRUB (Legacy)
* simpler code structure
* modular model
* internationalization (support for non-ASCII character sets)
* GUI interface

`/boot/grub/grub.cfg` still exists but is not supposed to be edited.

File and directories
* `/boot/grub/grub.cgf` - automatically created central config file
* `/etc/default/grub` - general options (no menu entries)
* `/etc/grub.d` - helper scripts; you can add scripts here to add menu entries

GRUB 2 generally automates lot of steps (helper scripts search the partitions
for know OSs and create the required entries).

When GRUB starts it launches all executable scripts in `/etc/grub.d`.

Adding a menu entry
===================

Custom startup script to boot the System Rescue CD from the hard disk:

    01 echo "Modified entry for launching a Rescue CD as an Image" >&2
    02 cat << EOF
    03
    04 menuentry "Starting System Rescue CD from hard disc" {
    05         set root=(hd0,10)
    06         linux   /sysrcd/rescuecd subdir=sysrcd setkmap=de
    07         initrd  /sysrcd/initram.igz
    08 }
    09 EOF

* 05 - the 10th partition of the first hard disk is the root filesystem
    (partition numbering starts from 1, not from 0 as in GRUB Legacy)
* 06 - defines the kernel path (`root` in GRUB Legacy) with two parameters: `subdir` and `setkmap`
* 07 - defines the initial RAM disk path

Source
======

Linux Magazine 111, February 2010
