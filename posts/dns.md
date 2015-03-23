Resource records

    [name] [ttl] [class] type data
    
name

* host or domain (if ommitted referes to the previous entity)
* relative or absolute (ends with a dot)

ttl

* how long can data be cached and still considered valid
* defaults to `$TTL` directive
* once records are cached outside you local network, you cannot force them to be discarded

class

* network type: IN (default), HS, CH (ChaosNet :-)

type

* NS - Name Server
* A - IPv4 Address (Name-to-address translation)
* PTR - Pointer (Address-to-name translation)
* MX - Mail Exchanger (Controls email routing)
* CNAM - Canonical Name (Nicknames or aliases for a host)

Sources

* ULSAH


