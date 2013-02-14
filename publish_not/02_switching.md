# LAN switching
###### ccna, networking

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

## LAN design

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

Two types

1. Catalyst -- for Enterprises (core switch 6500 can run Cisco IOS or Cat OS)
2. Linksys -- for home use

CLI can be accessed via

* console (rollover cable - DB-9 to RJ-45, bright blue) -- physical access
 * 9600 bits/second
 * No HW flow control
 * 8-bit ASCII
 * No parity bits
 * 1 stop bit
* Telnet
* SSH

CLI modes

.. user EXEC mode (user mode)

.. enable mode

    > enable

.. configuration changes in enable mode affect the active config (RAM) after pressing Enter!

Configuration modes

.. global (`hostname(config)#`)

    configure terminal

.. line (`hostname(config-line)#`)

    line console 0
    line vty 0 15

.. interface (`hostname(config-if)#`)

    interface <type> <number>

Exiting modes

* `end`, <Ctrl-z> -- go back to privileged EXEC mode
* `exit` -- go one configuration mode up

Configuration files

* Startup-config (`#show startup-config`) -- initial configuration, set after reload
* Running-config (`#show running-config`) -- current configuration, dynamically changed by configuration commands

Config files storage

* RAM (or DRAM) -- Running-config
* ROM -- bootstrap (or boothelper) - first loaded program that subsequently load Cisco IOS into RAM
* Flash memory (chip or removable memory card) -- Cisco IOS image, backups of config files, other files
* NVRAM -- Startup-config

SW initialization

* Cisco: reload
* PC: reboot, restart

Managing config files

    copy {tftp | runnning-config | startup-config} {tftp | running-config | startup-config}

.. file => NVRAM or file => TFTP -- file replaces the original one

.. file => RAM -- merge

.. revert changes in running-config

    copy startup-config running-config  # not 100% reliable
    reload                              # 100% reliable
    
.. erase NVRAM

    erase nvram:  # new, recommended
    write erase
    erase startup-config
    
.. erase running config -- erase NVRAM + `reload`

IFS (IOS File System) alternative names

* startup-config = nvram: = nvram:startup-config
* running-config = system:running-config

Setup mode -- initial switch configuration via questions (System configuration dialog)

## Switch configuration

### Features in common with routers

Password + hostname

    #configure terminal
    (config)#enable secret cisco  # hide (via MD5 hashing) clear text passwords in running-config
    (config)#hostname Emma
    (config)#line console 0       # serial console 
    (config-line)#password 123
    (config-line)#login
    (config-line)#exit
    (config)#line vty 0 15        # telnet
    (config-line)#password 123
    (config-line)#login
    (config-line)#exit
    (config)#exit
    #show running-config
    
.. with default seetings, telnet users are rejected
    
SSH

    #configure terminal
    (config)#line vty 0 15
    (config-line)#login local                  # local users, no AAA
    (config-line)#transport input telnet ssh   # to improve security, leave out telnet
    (config-line)#exit
    (config)#username foo password 123
    (config)#ip domain-name example.com
    (config)#crypto key generate rsa
    (config)#^Z
    #show crypto key mypubkey rsa
    
Password encryption

* `service password-encryption` - all existing and future passwords encrypted (uses type 7 algorithm)

Banners

* MOTD (`banner`) -- shown before login
* Login (`banner login #`) -- shown before login
* Exec (`banner exec Z`) -- shown after login

Logging and timeout

.. normally logs are emitted anytime, including right in the middle of a command - to improve this

    logging synchronous
    
.. timeout (0 0 never times out)

    exec-timeout <minutes> <seconds>

### Switch configuration and operation

default (factory) switch configuration

* all interfaces enabled (`no shutdown`)
* autonegotation for ports with multiple speeds and duplex setting (`speed auto`, `duplex auto`)

IP Address

* needed only for mamangement
* VLAN 1 -- default VLAN used on all ports
* configure VLAN 1 interface to access the switch

.. Static IP address

    (config)#interface vlan 1
    (config-ig)#ip address 192.168.1.200 255.255.255.0
    (config-ig)#no shutdown
    (config-ig)#exit
    (config)#ip default-gateway 192.168.1.1

.. DHCP

    (config)#interface vlan 1
    (config-ig)#ip address dhcp
    (config-ig)#no shutdown
    (config-ig)#^Z
    #show dhcp lease

Interfaces

    (config)#interface FastEthernet 0/1
    (config-if)#duplex full
    (config-if)#speed 100
    (config-if)#description Server1 connects here

Port security

.. if you know what devices are to be connected to particular interfaces

    switchport mode access
    switchport port security
    switchport port-security maximum <number>  # defaults to 1
    switchport port-security violation { protect | restrict | shutdown }  # default is shutdown
    
    switchport port-security mac-address <mac-address>  # use multiple times to define more than one
        or
    switchport port-security mac-address sticky  # dynamically learn MAC addresses

... actions on security violation

* protect -- discard offeding traffic
* restrict -- protect + send log and SNMP message
* shutdown -- restrict + disable the interface (discard all traffic)

.. diagnostics

    show running-config
    show port-security interface fastEthernet 0/1

VLAN

.. a switch interface can be:

* access interface -- sends/receives frames only in a single VLAN
* trunking interface -- sends/receives frames in multiple VLANs

.. adding a new VLAN (by default there is VLAN 1, to which all interfaces are assigned):

    (config)#vlan 2
    (config-vlan)#name My-vlan  # defaults to VLAN0002
    (config)#interface range fastethernet 0/13 - 14
    (config-if)#switchport accesss vlan 2
    (config-if)#switchport mode access  # optional step to disable trunking
    
    #show vlan brief

Securing unused interfaces

.. Cisco interfaces are by default "plug and play" interfaces -- enabled (`no shutdown`), automatically negotiate speed and duplex, assigned to VLAN 1, use VLAN trunking and VTP

.. security recommendations (only the first is really required):

* administratively disable the interface (`shutdown`)
* disable VLAN trunking and VTP (`switchport mode access`)
* assign the port to an unused VLAN (`switchport access vlan <number>`)

## Switch troubleshooting

## WLANs

---

Source:

* W. Odom: CCENT/CCNA ICDN1 (2012)
