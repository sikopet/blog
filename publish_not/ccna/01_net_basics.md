# 01 Networking Fundamentals
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

 * Please Do Not Throw Sausage Pizza Away
 * Same-layer interaction -- the protocol defined by each layer uses a header data to communicate what each computer wants to do
 * Adjacent-layer interaction -- the higher layer requests that the next lower layer perform the needed function

  ![TCP error recovery service provided to HTTP](https://raw.github.com/jreisinger/blog/master/files/tcp_error_recovery.png "TCP error recovery service provided to HTTP")

### TCP/IP network access layer encapsulation

![Using ethernet to forward an IP packet to the router](https://raw.github.com/jreisinger/blog/master/files/network_access_layer.png "Using ethernet to forward an IP packet to the router")

### Encapsulation and data

![Perspectives on encapsulation and data](https://raw.github.com/jreisinger/blog/master/files/data_perspectives.png "Perspectives on encapsulation and data")

## LANs

Most common Ethernet types

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

CSMA/CD algorith (required by hubs)

 * a device that wants to send a frame waits until the LAN is silent
 * if a collission occurs, the devices that caused the collision wait a random amount of time and then try again

TIA standard Ethernet cabling pinouts

![T568A vs. T568B](https://raw.github.com/jreisinger/blog/master/files/t568a_b.jpg "T568A vs. T568B")

 * straight-through cable -- both ends of the cable use the same standard (devices use the opposite pins when transmitting) - PC <=> Hub
 * crossover cable -- devices use the same pins to transmit - Hub <=> Hub
 * devices that transmit on 1,2 and receive on 3,6: PC NICs, routers
 * devices that transmit on 3,6 and receive on 1,2: hubs, switches
  * auto-mdix -- Cisco switch feature that readjusts the standard logic when wrong cables are used

Half duplex vs. full duplex

 * HDX -- device either sends or receivs, but not both at the same time (imposed by CSMA/CD)
 * FDX -- possible if only one device is cabled to each switch's port (full use of bandwidth)

Ethernet addressing terminology

 * MAC = Ethernet address = NIC address = LAN address -- 6-byte (48 bit, 12 hex digits) address usually burned in a ROM chip
  * 3 bytes -- Organizationally Unique Identifier (OUI)
  * 3 bytes -- vendor assigned part
 * Unicast address -- MAC address representing a single LAN interface (`FFFF.FFFF.FFFF`)
 * Multicast address -- subset of Ethernet devices (`0100.5exx.xxxx`)

LAN headers

          DIX
         +--------+-----------+------+------+----------+---+
         |Preamble|Destination|Source| Type |Data + pad|FCS|
    Bytes|   8    |     6     |  6   |  2   | 46-1500  | 4 |
         +--------+-----------+------+------+----------+---+

          IEEE 802.3 (orig)
         +----+---+-----------+------+------+----------+---+
         |Pre.|SFD|Destination|Source|Length|Data + pad|FCS|
         | 7  | 1 |     6     |  6   |  2   | 46-1500  | 4 |
         +----+---+-----------+------+------+----------+---+

          IEEE 802.3 (rev. 1997)
         +----+---+-----------+------+------+----------+---+
         |Pre.|SFD|Destination|Source|Len./ |Data + pad|FCS|
         | 7  | 1 |     6     |  6   |type 2| 46-1500  | 4 |
         +----+---+-----------+------+------+----------+---+

 * IEEE 802.3 Ethernet header/trailer fields
  *  Preamble -- synchronization
  *  Start Field Delimiter -- tells that next byte is destination MAC address
  *  Length/Type -- lenght/type of data field (either length or type is present, not both)
  *  Data and padding -- data from a higher layer (ex. L3 PDU - IP packet)
  *  Frame Check Sequence -- used by NIC to check the frame integrity

## WANs

 * WAN standads and protocols -- networking spanning relatively large distances compared to LANs

### OSI L1 Point-to-Point WANs

Leased line -- a WAN circuit usually not owned by the data owner but by a telco (telephone company)

                      |                                               |
                      |      T   E   L   C   O        N  E  T         |
                      |                                               |
                      |           CO                                  |
    +-------+    +---+|      +----------+          +----------+       |+---+    +-------+
    |Router1+----+CSU+-------+WAN switch+----------+WAN switch+--------+CSU+----+Router2|
    +-------+    +---+|      +----------+          +----------+  ^    |+---+ ^  +-------+
        ^          ^  |                                          |    |      |
        |          |  |                                          |    |    Short cable
        +----------+  |                                          |    |    (max 15m)
        |             |                                          |    |
        |           Demarc                                       |  Demarc
        |                                                        |
       CPE                                                Long cable (KMs)

![WAN connectors](https://raw.github.com/jreisinger/blog/master/files/wan_serial_cables.jpg "WAN connectors")

WAN links speeds
 
 * DS0 - 64 kbps
 * DS1 (T1) - 1.544 Mbps (24 DS0 + 8 kbps overhead)
 * DS3 (T3) - 44.736 Mbps (28 DS1s + mngt. overhead)
 * E1 - 2.048 Mbps (32 DS0s)
 * E3 - 34.368 Mbps (16 E1s + mngt. overhead)
 * J1 (Y1) - 2.048 Mbps (32 DS0s, Japanese standard)

### OSI L2 Point-to-Point WANs

### Packet switching

## IPv4 addressing and routing

## TCP/IP transport, application and security

--

**Sources**: W. Odom: CCENT/CCNA ICDN1 (2012), Wikipedia, "Google images"
