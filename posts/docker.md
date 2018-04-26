(Up-to-date [source](https://github.com/jreisinger/blog/blob/master/posts/docker.md) of this post.)

Docker is a container technology. It's a well timed fusion of

* kernel features
* filesystem tricks
* networking hacks

Think of a container not as a virtual machine but a very lightweight wrapper
around a single Unix *process*.

Docker revision controls

1. filesystem layers
2. image tags

Terminology
-----------

Docker *server* - the `docker` command run in daemon mode on a Linux host:

    $ sudo docker -d -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375

![docker architecture](https://raw.github.com/jreisinger/blog/master/files/docker_architecture.png "Docker architecture")

Docker *image* - one or more filesystem layers and metadata that represent all
the files required to run a Dockerized application

![docker images](https://raw.github.com/jreisinger/blog/master/files/docker_images.png "Docker images")

Docker *container* - a Linux container that has been instantiated from a Docker
image

Images
------

To launch a container

* download a public image
* create your own

To create a custom image you need a `Dockerfile` - each line in a Dockerfile creates a new image layer that is stored by Docker

Build an image:

    git clone https://github.com/spkane/docker-node-hello.git
    cd docker-node-hello
    docker build -t example/docker-node-hello:latest .

Run an image (or a container?):

    docker run -d -p 80:8080 example/docker-node-hello:latest

* `-d, --detach` run container in background (daemon mode) and print container ID
* `-p 80:8080` tells Docker to proxy the container's port 8080 on the host's port 80 (port binding)
* `example/docker-node-hello` image to derive the container from
* `:latest` tag specifying the image version

Remove an image:

    docker images
    docker rmi <image_id>

Remove all images on your Docker host:

    docker rmi $(docker images -q -)

Containers
----------

A container is a self-contained execution environment that shares the kernel of
the host system and which is (optionally) isolated from other containers in the
system.

Containers are a *Linux only* technology.

Create a container (see also "Run an image" above):

    docker run --rm -ti ubuntu /bin/bash

* `run` - `create` + `start`
* `--rm` - delete the container when it exits
* `-t` - allocate a pseudo-TTY
* `-i` - interactive session, e.i. keep STDIN open
* `/bin/bash` - executable to run within the container

Get into a running container:

    docker ps
    docker exec -it <container_id> /bin/bash

Stop a container:

    docker stop <container_id>

Remove a container:

    docker ps -a
    docker rm <container_id>

Remove all containers on your Docker host:

    docker rm  $(docker ps -a -q)

Volumes
-------

* heavy reliance on the read/write filesystem layer isn't the best storage
    solution
* the read/write filesystem layer gets removed when the container is removed (`docker rm ...`)
* Docker has the notion of volumes that are maintained separately from the union
    filesystem
* volumes can be shared among containers

Add a volume to a container (`-v`):

    $ docker run -v /data --rm --hostname web --name web -d nginx
    $ docker inspect -f '{{ json .Mounts }}' web | jq
    [
      {
        "Type": "volume",
        "Name": "2d80bc1056787f16b71fb0edced98b3036252083044b1c8db536627c2544a121",
        "Source": "/var/lib/docker/volumes/2d80bc1056787f16b71fb0edced98b3036252083044b1c8db536627c2544a121/_data",
        "Destination": "/data",
        "Driver": "local",
        "Mode": "",
        "RW": true,
        "Propagation": ""
      }
    ]

Add *bind volume* (mount volume on the host and in a container simultaneously):

    $ docker run -v /mnt/data:/data --rm --name web -d nginx
    $ docker inspect -f '{{ json .Mounts }}' web
    [{"Type":"bind","Source":"/mnt/data","Destination":"/data","Mode":"","RW":true,"Propagation":"rprivate"}]

Have a data volume container:

    $ docker create -v /mnt/data:/data --name nginx-data nginx # never runs
    $ docker run --volumes-from nginx-data -p80:80 --name web -d nginx

Networks
--------

During installation Docker creates three default networking operations:

    $ docker network ls
    NETWORK ID          NAME                DRIVER              SCOPE
    0e07cd43ad1b        bridge              bridge              local
    1876373e07e4        host                host                local
    e3f087868688        none                null                local

* bridge is the default -> private namespaced network within the host
* with host networking no separate network namespace is used (`docker run --net
    host ...`)
* when you use `-p` Docker creates `iptables` rules that route traffic from the
    host's public interface on the container's interface on the bridge network

![docker bridge network](https://raw.github.com/jreisinger/blog/master/files/docker_bridge.png "Docker bridge network")

Monitoring and cleanup
----------------------

Containers' statistics:

    docker stats [--no-stream]

Clean up:

    # you will be asked to confirm
    docker system prune                                     # containers, images
    docker images prune                                     # only images

    # be careful
    docker volume rm $(docker volume ls -qf dangling=true)  # volumes

Limiting a container's resources
--------------------------------

* a container has no resource constraints by default
* Docker provides a way to limit memory, CPU and block IO resources
* your kernel must support Linux capabilities (`docker info | grep WARNING`)

Memory

* if the kernel detects that there is not enough memory, it throws an `Out of Memory Exception` and starts killing processes
* any process is subject to killing (including Docker)
* a process that uses lot of memory but has not been running for long time is a most likely candidate to get killed (https://www.kernel.org/doc/gorman/html/understand/understand016.html)
* Docker adjusts OOM priority in the Docker daemon so it's less likely to get killed
* the OOM priority on containers is not adjusted so they are more likely to be killed than the Docker daemon

To limit the memory resource to 500 MB and forbid access to swap for a container:

    docker run -it --rm --name mem-muncher --memory=500m --memory-swap=500m mem-muncher

See https://docs.docker.com/config/containers/resource_constraints/ for more.

Swarm
-----

* [tutorial](https://docs.docker.com/engine/swarm/swarm-tutorial/)
* [service placement](https://docs.docker.com/engine/swarm/services/#control-service-placement) (affinity)
* [monitoring](https://github.com/stefanprodan/swarmprom)
* [setup](https://gist.github.com/jreisinger/a196f3e51e3a7069f7f91665025570cf) a simple cluster (in VirtualBox)

Sources
-------

* Docker: Up & Running (2015)
* Unix and Linux System Administration Handbook, 5th ed. (2017)
* [Building containers from scratch with Go](https://www.safaribooksonline.com/library/view/building-containers-from/9781491988404/) (2017, video)
