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

### OSI and TCP/IP models

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
 * Same-layer interaction -- the protocol defined by each layer uses a header data to communicate what each computer wants to do
 * Adjacent-layer interaction -- the higher layer requests that the next lower layer perform the needed function

  ![TCP error recovery service provided to HTTP](https://raw.github.com/jreisinger/blog/master/files/tcp_error_recovery.png "TCP error recovery service provided to HTTP")

### TCP/IP network access layer encapsulation

![Using ethernet to forward an IP packet to the router](https://raw.github.com/jreisinger/blog/master/files/network_access_layer.png "Using ethernet to forward an IP packet to the router")

### Encapsulation and data

![Perspectives on encapsulation and data](https://raw.github.com/jreisinger/blog/master/files/data_perspectives.png "Perspectives on encapsulation and data")

## LANs

<table>
  <tr>
    <th>Name</th>
    <th>Speed (Mbps)</th>
    <th>Alt. name</th>
    <th>Standard</th>
    <th>Cable (max)</th>
  </tr>
  <tr>
    <td>Ethernet</td>
    <td>10</td>
    <td>10BASE-T</td>
    <td>IEEE 802.3</td>
    <td>Copper (100m)</td>
  </tr>
  <tr>
    <td>Fast ethernet</td>
    <td>100</td>
    <td>100BASE-TX</td>
    <td>IEEE 802.3u</td>
    <td>Copper (100m)</td>
  </tr>
  <tr>
    <td>Gigabit ethernet</td>
    <td>1000</td>
    <td>1000BASE-LX, 1000BASE-SX</td>
    <td>IEEE 802.3z</td>
    <td>Fiber (550m, 5km)</td>
  </tr>
  <tr>
    <td>Gigabit ethernet</td>
    <td>1000</td>
    <td>1000BASE-T</td>
    <td>IEEE 802.3ab</td>
    <td>Copper (100m)</td>
  </tr>
</table>

 * "T" in alt. names -- twisted pair

CSMA/CS algorith

 * a device that wants to send a frame waits until the LAN is silent
 * if a collission occurs, the devices that caused the collision wait a random amount of time and then try again

TIA standard Ethernet cabling pinouts

![T568A vs. T568B](https://raw.github.com/jreisinger/blog/master/files/t568a_b.jpg "T568A vs. T568B")

## WANs

## IPv4 addressing and routing

## TCP/IP transport, application and security
