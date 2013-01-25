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

* store-and-forward
* cut-through
* fragment-free

## Cisco switches

## Switch configuration

## Switch troubleshooting

## WLANs

##
