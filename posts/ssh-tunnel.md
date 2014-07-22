(Up-to-date [source](https://github.com/jreisinger/blog/blob/master/posts/ssh-tunnel.md) of this post.)

## Forwarding remote port (firewall tunneling via SSH)

We want to allow the tech access the incomp (intranet) host from the outcomp.sk (Internet) host:

![SSH Tunneling](https://raw.github.com/jreisinger/blog/master/files/ssh_tunneling.png)

1) Redirect the port 2222 on outcomp.sk to port 22 on incomp:

    incomp:~$ ssh -R 2222:localhost:22 user@outcomp.sk
    outcomp.sk:~$ while [ 1 ]; do date; sleep 300; done  # to keep the connection open
    
2) Connect to intranet host:

    outcomp.sk:~$ ssh -p 2222 root@localhost

We want to connect to a router web interface (192.168.1.1:443), to make some configuration changes, which is not accessible from Internet. However we can connect to a host behind the router - LAN (intranet) host.

1) `/etc/ssh/sshd_config` of host.in.internet.com has to contain:

    GatewayPorts yes

2) LAN (intranet) host:

    ssh -R "*:3333:192.168.1.1:443" host.in.internet.com

3) Web browser somewhere in Internet:

    https://host.in.internet.com:3333

## Forwarding local port

We want to connect to a remote database running on dbserver but it is configured to allow connections only from localhost (127.0.0.1). We use port 3307 on the client because the default 3306 port is already being used (e.g. you are running MySQL server on the client).

    client:~$ ssh -L 3307:localhost:3306 root@dbserver
    client:~$ mysql -u root -p dbname -P 3307

## See also

 * [ssh -R 2222:localhost:22 user@host](http://explainshell.com/explain?cmd=ssh+-R+2222%3Alocalhost%3A22+user%40host)
 * [ssh -L 3307:localhost:3306 user@host](http://explainshell.com/explain?cmd=ssh+-L+3307%3Alocalhost%3A3306+user%40host)
