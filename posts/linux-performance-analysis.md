Taking stock of hardware
========================

Sources of hardware information:

    /proc/cpuinfo       # one entry for each core seen by the OS
    /proc/meminfo
    /proc/diskstats

Desktop Management Interface (DMI, aka SMBIOS):

    dmidecode -t <type>

Network:

    ifconfig -a

CPU
===

Overall utilization
-------------------

Is CPU the bottleneck?

    $ vmstat 5 5 --unit M
    procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
     r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
     1  0      0    230    687  44366    0    0  2923  3037    1    0  4  3 85  7
     0  0      0    218    687  44380    0    0 76160    10 2814 4233  3  1 96  0
     0  0      0    224    687  44377    0    0 79462     0 3253 5979  3  2 95  0
     0  0      0    230    687  44374    0    0 82432    18 3069 5674  3  1 95  0
     1  0      0    233    687  44372    0    0 86400    18 3705 5215  3  2 95  0

* first line reports averages since system's boot
* `r`  - runnable processes
* `b`  - processes blocked for I/O
* `in` - interrupts
* `cs` - context switches
* `us` - user time
* `sy` - system (kernel) time
* `id` - idle time 
* `wa` - waiting for I/O

Load average
------------

How many pieces is the CPU divided into?

Average number of runnable (ready to run) processes:

    $ uptime 
     13:03:23 up 8 days, 13:06,  2 users,  load average: 1.13, 1.31, 1.38

* 5, 10, and 15-minute averages 
* on a single-processor system - usually 3 means busy, > 8 means problem
* on a multi-core system - if number of cores = load average => all cores have
 just enough to do all the time
* process waiting for input (e.g. from keyboard, network) are not considered
 ready to run (only processes that are actually doing something contribute to
 load average)

Per process consumption
-----------------------

Which processes are hogging resources?

Snapshot of current processes:

    $ ps -aux

* `m` - show threads

Processes and other system information regularly updated:

    $ top

* `z`, `x`   - turn on colors and highlight sort column
* `Spacebar` - update display immediately
* `M`        - sort by current resident memory usage
* `T`        - sort by total (cumulative) CPU usage
* `H`        - toggle threads/processes display
* `u`        - display only one user's processes
* `f`        - select statistics to display

How much CPU time a process uses:

    $ time ls    # or /usr/bin/time

* user time - time the CPU spent running the program's *own* code
* system time - time the kernel spends doing the process's work (ex. reading files or directories)
* real/elapsed time - total time it took to run the process, including the time
 the CPU spent running other tasks

Threads
-------

Some processes can be divided into pieces called *threads*:

* very similar to processes: have TID, are scheduled and run by the kernel
* processes don't share system resources
* all threads inside a single process share system resources (I/O connections, 
    memory)

Many processes have only one thread - *single-threaded* processes (usually
called just processes).

All processes start out single-threaded. This starting thread is called *main
thread*. The main thread then starts new threads in similar fashion a process
calls `fork()` to start a new process.

Threads are useful when process has a lot to do because threads can run
simultaneously on multiple processors and *start faster* than processes and
*intercommunicate more efficiently* (via shared memory) than processes (via
network connection or pipe).

It's usually not a good idea to interact with individual threads as you would
with processes.

Memory
======

See also `posts/linux-ate-my-memory`.

Amount of paging (swap) space that's currently used:

    # swapon -s
    Filename                Type        Size    Used    Priority
    /dev/sdb2               partition   7815616 0       -1

* in kilobytes

`vmstat` (see above) fields:

* `si` - swapped in
* `so` - swapped out => if your system has constant stream of page outs, buy more memory

Storage I/O
===========

    $ iostat
    Linux 3.2.0-4-amd64 (backup2)   06/14/2015  _x86_64_    (16 CPU)
    
    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
               3.80    0.34    3.17    7.49    0.00   85.20
    
    Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
    sdb              49.61      1852.45       349.64 1369392967  258461851
    sdc             301.74     21510.91     24545.93 15901546498 18145130448
    sdd              75.02      6184.17      6195.25 4571531985 4579724644
    sda             307.37     16906.94     17127.65 12498149921 12661307662
    dm-0            131.14      8082.58      9533.25 5974897325 7047285056
    dm-1            172.96     13428.25     15012.67 9926593437 11097845392
    dm-2            107.96      1612.16       347.05 1191762057  256547336

* `tps` - total I/O transfers per second
* `kB_read` - total kiloBytes read

Processes using file or directory on `/usr` filesystem (mount point):

    $ fuser -cv /usr
                         USER        PID ACCESS COMMAND
    /usr:                root     kernel mount /
                         root          1 .rce. init
                         root          2 .rc.. kthreadd

.. ACCESS:
* `f`,`o`  - the process has a file open for reading or writing
* `c`      - the process's current directory is on the filesystenm
* `e`, `t` - the process is currently executing a file
* `r`      - the process's root directory (set with `chroot`) in on the filesystem
* `m`, `s` - the process has mapped a file or shared library

List open files:

    $ lsof    # pipe output to pager or use options

Resources
=========

* ULSAH, 4th, Ch. 29 
* How Linux Works, 2nd, Ch. 8
