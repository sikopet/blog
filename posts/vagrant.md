Search boxes - https://atlas.hashicorp.com/boxes/search

Add a box:

    vagrant box add https://atlas.hashicorp.com/ubuntu/boxes/trusty64

Initialize the box:

    mkdir ubuntu-trusty64
    cd ubuntu-trusty64
    vagrant init ubuntu/trusty64


Start the box:

    vagrant up

Check the box status:

    vagrant status

Ssh to the box:

    vagrant ssh

Cleaning up:

    # fast to start again; the VM still eats diskspace
    vagrant suspend

    # graceful shutdown; slower to start again, still eats disk space
    vagrant halt

    # power it down and remove all of the guest hard disks; even slower to
    # start again (reimport and reprovisioning)
    vagrant destroy

Show status of all boxes on the host (independent of the directory you're in):

    vagrant global-status

Resources
---------

* https://sysadmincasts.com/episodes/4-vagrant
