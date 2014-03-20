# IP networks
###### networking

## IPv4 Address Classes

    .--------------------------------------------------------------------------------------------------------.
    | Class | First octet | Networks                  | Number of networks | Purpose                         |
    +-------+-------------+---------------------------+--------------------+---------------------------------+
    | A     | 1 - 126     | 10.0.0.0 - 126.0.0.0      | 2^7 - 2 = 126      | Unicast (large networks)        |
    | B     | 128 - 191   | 128.0.0.0 - 191.255.0.0   | 2^14 = 16,384      | Unicast (medium-sized networks) |
    | C     | 192 - 223   | 192.0.0.0 - 223.255.255.0 | 2^21 = 2,097,152   | Unicat (small networks)         |
    | D     | 224 - 239   |                           |                    | Multicast                       |
    | E     | 240 - 255   |                           |                    | Experimental                    |
    '-------+-------------+---------------------------+--------------------+---------------------------------'
<!-- Original table data:
Class;First octet;Networks;Number of networks;Purpose
A;1 - 126;10.0.0.0 - 126.0.0.0;2^7 - 2 = 126;Unicast (large networks)
B;128 - 191;128.0.0.0 - 191.255.0.0;2^14 = 16,384;Unicast (medium-sized networks)
C;192 - 223;192.0.0.0 - 223.255.255.0;2^21 = 2,097,152;Unicat (small networks)
D;224 - 239;;;Multicast
E;240 - 255;;;Experimental

-->

## RFC 1918 Private Address Space

    .------------------------------------------------------------------.
    | Network class | Networks                    | Number of networks |
    +---------------+-----------------------------+--------------------+
    | A             |                    10.0.0.0 |                  1 |
    | B             | 172.16.0.0. - 172.31.0.0    |                 16 |
    | C             | 192.168.0.0 - 192.168.255.0 |                256 |
    '---------------+-----------------------------+--------------------'
<!-- Original table data:
Network class;Networks;Number of networks
A;10.0.0.0;1
B;172.16.0.0. - 172.31.0.0;16
C;192.168.0.0 - 192.168.255.0;256
-->
