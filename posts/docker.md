Docker sits righ in the *middle* of some of the most enabling technologies of the
last decade (virtualization, configuration management, deployment automation).

Think of a container not as a virtual machine but a very lighweight wrapper
around a single Unix *process*.

Docker revision control

1. filesystem layers
2. image tags

Terminology
-----------

Docker server - the `docker` command run in daemon mode on a Linux host:
    
    $ sudo docker -d -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375

Docker image - one or more filesystem layers and metadata that represent all
the files required to run a Dockerized application

Docker container - a Linux container that has been instantiated from a Docker
image

Sources

* Docker: Up & Running (2015)

