Initiliaze (env. vars etc.)

```
source ~/.openrc
```

Networking (Neutron)

```
openstack network list              # all nets
openstack network show <id>         # details
openstack ip availability show <id> # IP addresses
```

Heat

```
heat stack-list
heat stack-show <id>
heat resource-list <id>                         # list stack resources
heat resource-show <stack-id> <resource-name>   # resource details
```
