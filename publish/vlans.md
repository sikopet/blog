# Virtual LANs
###### networking

.. broadcast sent by one host in a VLAN => received and processed by all hosts

.. a switch interface can be:

* access interface -- sends/receives frames only in a single VLAN
* trunking interface -- sends/receives frames in multiple VLANs

## Trunking

* trunking -- allows passing frames from multiple VLANs over a single physical connection
* when there are multiple interconnected switches - VLAN trunking must be between switches
* Cisco supported trunking protocols: ISL, IEEE 802.1Q

### ISL

* proprietary
* only between two Cisco switches that support ISL
* encapsulates the original frame in another Ethernet header and trailer (adds VLAN number)

### IEEE 802.1Q

* more popular
* inserts an extra 4-byte VLAN header into the original frame's Ethernet header
* must recalculate FCS (frame check sequence)
* defines one VLAN (VLAN 1 by default) as a native VLAN (no header is added to frames in this VLAN)

.. adding a new VLAN (by default there is VLAN 1, to which all interfaces are assigned):

    (config)#vlan 2
    (config-vlan)#name My-vlan  # defaults to VLAN0002
    (config)#interface range fastethernet 0/13 - 14
    (config-if)#switchport accesss vlan 2
    (config-if)#switchport mode access  # optional step to disable trunking
    
    #show vlan brief