# Networking Fundamentals
###### ccna

## Networking models

OSI layering benefits
 * less complex
 * standard interfaces between layers
 * easier to learn
 * easier to develop
 * multivendor interoperability
 * modular engineering - one vendor writes SW implementing higher layers (e.g. web browser), another vendor writes SW implemnting lower layers (e.g. M$'s built-in TCP/IP SW)

OSI and TCP/IP models

```
           OSI              TCP/IP             TCP/IP
                            original           updated
      +------------+     +------------+     +------------+
    7 |Application |     |            |     |            |
      |------------+     |            |     |            |
    6 |Presentation|     |Application | 5-7 |Application |
      |------------+     |            |     |            |
    5 |Session     |     |            |     |            |
      |------------+- - -+------------+- - -+------------+
    4 |Transport   |     |Transport   |  4  |Transport   |
      |------------+- - -+------------+- - -+------------+
    3 |Network     |     |Internetwork|  3  |Internetwork|
      |------------+- - -+------------+- - -+------------+
    2 |Data link   |     |Network     |  2  |Data link   |
      |------------+     |            |- - -|            |
    1 |Physical    |     |access      |  1  |Physical    |
      +------------+     +------------+     +------------+

```

 * Please Do Not Throw Sausage Pizza Away

TCP/IP network access layer encapsulation

![Using ethernet to forward an IP packet to the router](https://raw.github.com/jreisinger/blog/master/files/network_access_layer.png)


## LANs

## WANs

## IPv4 addressing and routing

## TCP/IP transport, application and security
