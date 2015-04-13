Network management protocol:
* discover device configuration, health, network connections
* modify some configuration
* agents (managed devices, server program) can send *traps* (notification
    messages) to management stations (client program)

SNMP defines a hierarchical namespace of variables. The naming hierarchy is
made up of *MIB*s - structured text files that describe the data accessible
through SNMP. *OID*s - names for a specific managed piece of data.

Source:
* ULSAH
