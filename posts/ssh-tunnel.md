## Firewall tunneling via SSH

We want to allow the tech access the incomp (intranet) host from the outcomp.sk (Internet) host:

![SSH Tunneling](https://raw.github.com/jreisinger/blog/master/files/ssh_tunneling.png)

1) Redirect the port 2222 on outcomp.sk to port 22 on incomp.sk:

    incomp:~$ ssh -R 2222:localhost:22 user@outcomp.sk
    outcomp.sk:~$ while [ 1 ]; do date; sleep 300; done  # to keep the connection open
    
2) Connect to intranet host:

    outcomp.sk:~$ ssh -p 2222 root@localhost

## Connecting to a router web interface accessible only from intranet

We want to connect to router web interface (to make some configuration changes) which is not accessible from Internet. However we can connect to a Linux server behind the router.

1) `/etc/ssh/sshd_config` of host.in.internet.com has to contain:

    GatewayPorts yes

2) LAN (intranet) host:

    ssh -R "*:3333:192.168.1.1:443" host.in.internet.com

3) Web browser somewhere in Internet:

    https://host.in.internet.com:3333
