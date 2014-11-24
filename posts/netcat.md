(Up-to-date <a href="https://github.com/jreisinger/blog/blob/master/posts/netcat.md">source</a> of this post.)

<img src="https://raw.github.com/jreisinger/blog/master/files/knife.jpg" alt="Knife" height="63" width="109" align="right">

TCP/IP swiss army knife. Simple (yet powerful!) Unix utility that reads and writes data across network connections, using TCP or UDP.

Netcat as a Client
==================

Connect to some port of some host:

    nc <host> <port>

* your STDIN is sent to the host
* anything that comes back across network is sent to your STDOUT
* this continues indefinitely, until the network side closes (not until EOF on STDIN like many other apps)

Test remote HTTP server:

    nc google.com 80
    GET / HTTP/1.0

(press Enter two times after the `GET` line)

Check UDP port is open:

    nc -vu ns.nameserver.tld 53

Make sure no data (zero) is sent to the port you connect to:

    nc -v -z host.tld 21-25

Change source port / address (ex. to evade a FW):

    nc -p 16000 host.tld 22
    nc -s 1.2.3.4 host.tld 8181

Netcat as a Server
==================

Listen for an incoming connection on some port:

    nc -l <port>

Send a directory over the network:

.. host A (receiving data)

    nc -l 1234 | tar xvf -

.. host B (sending data)

    tar cf - </some/dir> | nc -w 3 <hostA> 1234

Send a whole partition over the network:

.. host A (receiving data)

    nc -l 1234 | dd of=backup_sda1

.. host B (sending data)

    dd if=/dev/sda1 | nc -w 3 <hostA> 1234

Run a command (potentially dangerous!); ex. open a shell access:

.. host A (server)

    nc -l 9999 -e /bin/bash

.. host B (client)

    nc hostA 9999

More
====

* <http://mylinuxbook.com/linux-netcat-command/>
