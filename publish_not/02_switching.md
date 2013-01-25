# LAN switching
###### ccna, net

## Concepts

* Hub -- one collision domain
* Bridge -- two collision domains
* Switch -- one collision domain per interface (microsegmentation)

Switching logic

1. forward or filter frame depending on the MAC address
1. learn MAC addresses by seeing frames' source MAC address
1. avoid loops by using STP

Switch's MAC address table = switching table = bridging table = CAM

Flooding

* send frames out of all interfaces except the incoming interface
* switch does this when there is no matching entry in MAC address table

Inactivity timer

* goes from 0 up (zeroed every time the same source MAC address arrives)
* when MAC address table is full, oldest entries (with largest timer) are removed

STP

* allows building redundant switching topology without loops
* makes interfaces into blocking or forwarding state
* without STP frames for turned off hosts would loop forever (in a circular three switch topology)
 * the same is true for broadcasts

Switch internal processing

* store-and-forward (most used on recent switches) -- receive all bits before forwarding a frame (can check FCS and discard faulty frames)
* cut-through -- forward as soon as possible (lower latency)
* fragment-free -- forward after receiving the first 64 bytes (can discard frames errored due to a collision)

Switch features

* if a single device is connected to a port => dedicated bandwidth to that device
* multiple simultaneous conversations etween devices on different ports
* if a single device is connected to a port => full duplex (doubling the bandwidth)
* rate adoption for devices with different Ethernet speeds

### LAN design

* collision domain (switch) -- set of NICs whose frames can collide (NICs share the available bandwidth)
* broadcast domain (router) -- set of NICs who all receive a broadcast frame sent be one of them

VLANs

(LAN = all devices in the same broadcast domain)

* group users by department
* create multiple broadcast domains
* reduce workload for STP
* better security - keep sensitive data on separate VLAN
* separate IP phone traffic from the traffic of PC connected to the phone

Switch types

* access -- connects directly to end-user device
* distribution -- aggregation point for access switches (less cabling, better performance)
* core -- even more aggregation

Ethernet LAN media

* 10BASE-T -- copper, CAT3 or better, two pair, max. 100m
* 100BASE-TX -- copper, CAT5 UTP or better, two pair, max. 100m
* 1000BASE-T -- copper, CAT5e UTP or better, four pair, max. 100m
* 1000BASE-LX -- fiber, max. 5km

## Cisco switches

## Switch configuration

## Switch troubleshooting

## WLANs

---

Source:

* W. Odom: CCENT/CCNA ICDN1 (2012)
