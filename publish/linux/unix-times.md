# Unix Times
###### linux, perl

Unix filesystems keep some metadata (data about data) on the files. There is also a time information among the metadata. Actually three types of them:

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
