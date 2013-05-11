# SSH Tunnel
###### networking, security

## Connecting to router accessible only from LAN

LAN host:

    ssh host.in.internet.com -R "*:3333:192.168.1.1:443"

`/etc/ssh/sshd_config` on host.in.internet.com has to contain:

    GatewayPorts yes

Web browser:

    https://host.in.internet.com:3333



    
