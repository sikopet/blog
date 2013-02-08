# Netcat (nc)
###### net, sec

TCP/IP swiss army knife. Simple (yet powerful!) unix utility that reads and writes data across network connections, using TCP or UDP.

Netcat as a client:

    nc host 80

* your STDIN is sent to the host
* anything that comes back across network is sent to your STDOUT
* this continues indefinitely, until the network side closes (not until EOF on STDIN like many other apps)

Test HTTP server:

    nc host 80
    GET / HTTP/1.0

(press Enter two times after the `GET` line)

Netcat a a server:

    nc -l -p 1234

Send a directory over the network:

.. host A (receiving data)

    nc -l -p 1234 | tar xvf -

.. host B (sending data)

    tar cf - </some/dir> | nc -w 3 <hostA> 1234

Send a whole partition over the network:

.. host A (receiving data)

    nc -l -p 1234 | dd of=backup_sda1

.. host B (sending data)

    dd if=/dev/sda1 | nc -w 3 <hostA> 1234
