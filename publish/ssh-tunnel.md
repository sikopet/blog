# SSH Tunnel
###### networking, security

## Connecting to router accessible only from LAN

1) `/etc/ssh/sshd_config` of host.in.internet.com has to contain:

    GatewayPorts yes

2) LAN host:

    ssh host.in.internet.com -R "*:3333:192.168.1.1:443"

3) Web browser somewhere in Internet:

    https://host.in.internet.com:3333



    
