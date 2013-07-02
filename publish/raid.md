# RAID
###### linux

## Simulating RAID failure

Simulate a failed disk

    mdadm /dev/md0 -f /dev/sdc1
    
Check the array status

    cat /proc/mdstat
    
Remove the failed disk

    mdadm /dev/md0 -r /dev/sdc1
    
(System shutdown and physical replacement of the disk should follow in real failure).

Add the disk back

    mdadm /dev/md0 -a /dev/sdc1
    
Whatch the array rebuilding - `watch cat /proc/mdstats`
    
    Every 2.0s: cat /proc/mdstat                                               Tue Jul  2 09:55:13 2013

    Personalities : [raid10]
    md0 : active raid10 sdc1[2] sda1[0] sdd1[3] sdb1[1]
          312574976 blocks super 1.2 512K chunks 2 near-copies [4/3] [UU_U]
          [>....................]  recovery =  0.6% (1024896/156287488) finish=68.1min speed=37959K/sec

    unused devices: <none>
