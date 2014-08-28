    .--------------------------------------------------------------------------------.
    |               Source: https://gist.github.com/hellerbarde/2843375              |
    +------------------------------------+---------------------+---------------------+
    | What                               | Time                | Human Readable Time |
    +------------------------------------+---------------------+---------------------+
    | L1 cache reference                 | 0.5 ns              |                     |
    | L2 cache reference                 | 7 ns                |                     |
    |                                    |                     |                     |
    | Main memory reference              | 100 ns              |                     |
    | Read 1 MB sequentially from memory | 250,000 ns          | 250 µs              |
    |                                    |                     |                     |
    | Compress 1K bytes with Zippy       | 3,000 ns            | 3 µs                |
    |                                    |                     |                     |
    | Send 2K bytes over 1 Gbps network  | 20,000 ns           | 20 µs               |
    | Round trip within same datacenter  | 500,000 ns          | 0.5 ms              |
    | Send packet CA->Netherlands->CA    | 150,000,000 ns      | 150 ms              |
    |                                    |                     |                     |
    | SSD random read                    | 150,000 ns          | 150 µs              |
    | Read 1 MB sequentially from SSD*   | 1,000,000 ns        | 1 ms                |
    | Disk seek                          | 10,000,000 ns       | 10 ms               |
    | Read 1 MB sequentially from disk   | 20,000,000 ns       | 20 ms               |
    '------------------------------------+---------------------+---------------------'
<!-- Original table data:
What ; Time ; Human Readable Time
L1 cache reference ; 0.5 ns
Round trip within same datacenter ; 500,000 ns ; 0.5 ms
Send packet CA->Netherlands->CA ; 150,000,000 ns ; 150 ms

SSD random read ; 150,000 ns ; 150 µs
Read 1 MB sequentially from SSD* ; 1,000,000 ns ; 1 ms
Disk seek ; 10,000,000 ns ; 10 ms
Read 1 MB sequentially from disk ; 20,000,000 ns ; 20 ms
L2 cache reference ; 7 ns

Main memory reference ; 100 ns             
Read 1 MB sequentially from memory ; 250,000 ns ; 250 µs

Compress 1K bytes with Zippy ; 3,000 ns ; 3 µs

Send 2K bytes over 1 Gbps network ; 20,000 ns ; 20 µs
-->

    .----------------------------------------------------------------------------------------------------.
    |                                     Source: ULSAH, p. 210, 204                                     |
    +-------------------+------------+----------------------+-------------------+-------------+----------+
    | What              | Size       | Sequenial Read Speed | Random Read Speed | Write Speed | Cost     |
    +-------------------+------------+----------------------+-------------------+-------------+----------+
    | LTO-3 write speed |            |                      |                   | 80MB/s      | $0.06/GB |
    | LTO-4 write speed |            |                      |                   | 120MB/s     | $0.05/GB |
    | HD                | Terrabytes | 100MB/s              | 2MB/s             |             | $0.10/GB |
    | SSD               | Gigabytes  | 250MB/s              | 250MB/s           |             | $3/GB    |
    '-------------------+------------+----------------------+-------------------+-------------+----------'
<!-- Original table data:
What ; Size ; Sequenial Read Speed ; Random Read Speed ; Write Speed ; Cost
LTO-3 write speed ;  ;  ;  ; 80MB/s ; $0.06/GB
LTO-4 write speed ;  ;  ;  ; 120MB/s ; $0.05/GB
HD ; Terrabytes ; 100MB/s ; 2MB/s ;  ; $0.10/GB
SSD ; Gigabytes ; 250MB/s ; 250MB/s ;  ; $3/GB
-->
