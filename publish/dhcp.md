# DHCP
###### linux

 * Dynamic Host Configuration Protocol
 * replacement of `bootp`
 * server listens on udp 67, answers through udp 68
 * often paired with DNS role
 * SOHO broadband routers can serve as DHCP servers (and also as NAT routers, switches)
 * break-even point for using it -- 6 - 12 computers

# Setting up a DHCP
 * ISC DHCP server -- most common, `dhcp`, `dhcp-server`, `dhcp3-server`, `isc-dhcp-server`
 * Dnsmasq -- DHCP + DNS, good for small networks

 1. Configure `/etc/dhcp/dhcpd.conf` file
 1. Start the DHCP server in debug mode to verify that the server is working: `/usr/sbin/dhcpd -d -f`
 1. To start the server for actual use, enter `/etc/init.d/isc-dhcp-server start`

`/etc/dhcp/dhcpd.conf`  

    ## Parameters -- describe general configuration
    ddns-update-style none;

    option domain-name "ianet";
    option domain-name-servers 195.146.128.60, 192.168.128.1;

    default-lease-time 600;
    max-lease-time 7200;

    log-facility local7;

    ## Declarations

    ## Dynamic addresses
    subnet 192.168.128.0 netmask 255.255.255.0 {
      range 192.168.128.10 192.168.128.100;
      range 192.168.128.150 192.168.128.200;
      # Default GW
      option routers 192.168.128.1;
    }

    ## Fixed addresses (not the same as static addresses)
    host neptune {
      hardware ethernet 0a:1b:2c:3d:4e:5f;
      fixed-address 192.168.128.11;
    }

    ## bootp support
    host bootpneptune {
      hardware ethernet 0a:1b:2c:3d:4e:5f;
      fixed-addresses 192.168.128.105;
      filename "/tftpboot/bootpneptune.boot";
    }

 * to find out MAC address from DHCP server: `ping -c 1 <ip.addr>; /sbin/arp <ip.addr>`

# dhcpd.leases
 * all leases the DHCP server has given out

`/var/lib/dhcp/dhcpd.leases`

    lease 192.168.128.17 {
        starts 5 2004/01/02 10:53:18;
        ends 5 2004/01/02 20:13:57;
        hardware ethernet 00:02:2d:5e:74:8c;
        client-hostname "lookfar.example.com";
    }

# DHCP relay

If you have multiple network segments (with routers in between the segments)
  * run multiple DHCP servers
  * run the DHCP server on the router
  * configure the router to route DHCP broadcast (Cisco: `ip-helper address`)
  * run DHCP relay agent (must be installed on one computer on each subnet): `dhcrelay 172.27.15.2`
   * it's the address of DHCP server on remote network
