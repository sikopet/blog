It's a well timed fusion of
* kernel features
* filesystem tricks
* networking hacks

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

Working with Docker images
--------------------------

To launch a container

* download a public image
* create your own

To create a custom image you need a `Dockerfile` - each line in a Dockerfile creates a new image layer that is stored by Docker

Build an image

    git clone https://github.com/spkane/docker-node-hello.git
    cd docker-node-hello
    docker build -t example/docker-node-hello:latest .

Run an image

    # 'example/docker-node-hello:latest' is a tag
    docker run -d -p 8080:8080 example/docker-node-hello:latest

Stop an image

    docker ps
    docker stop <container_id>

Remove an image

    docker images
    docker rmi <image_id>

Remove all images on your Docker host

    docker rmi $(docker images -q -)

Working with Docker containers
------------------------------

A container is a self-contained execution environment that shares the kernel of
the host system and which is (optionally) isolated from other containers in the
system.

Containers are a *Linux only* technology.

Create a container

    docker run --rm -ti ubuntu /bin/bash 

* run - `create` + `start`
* --rm - delete the container when it exits
* -t - allocate a pseudo-TTY
* -i - interactive session, e.i. keep STDIN open
* /bin/bash - executable to run within the container

Remove a container

    docker ps -a
    docker rm <container_id>

Remove all containers on your Docker host

    docker rm  $(docker ps -a -q)

Sources
-------

* Docker: Up & Running (2015)
* ULSAH v5 (2017)
