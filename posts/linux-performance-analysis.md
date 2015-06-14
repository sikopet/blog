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

Overall utilization - is CPU the bottleneck?

    $ vmstat 5 5 --unit M
    procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
     r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
     2  0      0   1358    719  41399    0    0  2921  3041    1    3  4  3 85  8
     1  0      0    758    719  42000    0    0 123085    18 4389 7400  5  2 93  0
     1  0      0    538    719  42222    0    0 45440    18 1727 3755  2  1 98  0
     2  0      0    231    716  42540    0    0 123085    18 4959 7107  5  2 93  0
     0  0      0    250    716  42534    0    0 43264    16 1661 3331  2  1 98  0

* first line reports averages since system's boot
* `r`  - runnable processes
* `b`  - processes blocked for I/O
* `in` - interrupts
* `cs` - context switches
* `us` - user time
* `sy` - system (kernel) time
* `id` - idle time 
* `wa` - watiting for I/O

Load average - avarage number of runnable processes (how many pieces is the CPU
devided into)?

    $ uptime 
     13:03:23 up 8 days, 13:06,  2 users,  load average: 1.13, 1.31, 1.38

* 5, 10, and 15-minute averages 
* on a multicore system - number of cores = max. load
* on a single-processor system - 3 means busy, > 8 means problem

Per process consumption - which processes are hogging resources?

    $ ps -aux

Memory
======

Storage I/O
===========
