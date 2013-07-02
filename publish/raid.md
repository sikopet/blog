# RAID
###### linux

## Simulating RAID failure

Simulate a failed disk:

    mdadm /dev/md0 -f /dev/sdc1
    
Check the array status

    cat /proc/mdstat
