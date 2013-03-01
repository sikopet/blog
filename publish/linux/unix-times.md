# Unix Times
###### linux, perl

Unix filesystems keep some metadata (data about data) about the files. There is also a time information among the metadata. Actually three types of them:

        .----------------------------------------------------------------------------------------------------.
        | Type        | Short name | ls option | Description                                                 |
        +-------------+------------+-----------+-------------------------------------------------------------+
        | Access Time | atime      | -ult      | when file was last accessed (read)                          |
        | Modify Time | mtime      | -lt       | when the actual contents of the file were last modified     |
        | Change Time | ctime      | -cl       | when the inode information (the metadata) was last modified |
        '-------------+------------+-----------+-------------------------------------------------------------'
<!-- Original table data:
Type;Short name;ls option;Description
Access Time;atime;-ult;when file was last accessed (read)
Modify Time;mtime;-lt;when the actual contents of the file were last modified
Change Time;ctime;-cl;when the inode information (the metadata) was last modified
-->

## Perl stat and lstat functions

To get more information about a file, call the `stat` function (returns pretty much everything that the underlying <a href="https://en.wikipedia.org/wiki/Stat_(system_call)">stat</a> Unix system call returns):

    my($atime, $mtime, $ctime) = (stat($filename))[8,9,10];

.. `$atime`, `$mtime`, and `$ctime` -- The three timestamps represented in the system's timestamp format: a 32-bit number telling how many seconds have passed since the ''Epoch'', an arbitrary starting point for measuring system time (it's the beginning of 1970 at midnight Universal Time on Unix systems).

## Changing timestamps with Perl

In those rare cases when you want to lie to other programs about when a file was most recently accessed (atime) or modified (mtime), use the `utime` function:

    my $atime = time;                 # now
    my $mtime = $time - 24 * 60 * 60; # one day (2 073 600 secs) ago
    utime $atime, $mtime, glob "*";   # set access to now, mod to a day ago

.. the third timestamp (ctime) is always set to "now" whenever anything alters a file - there's no way to set it with `utime`

.. the primary purpose of ctime is for incremental backups - if the file's ctime is newer that the date on the backup tape, it's time to back it up again
