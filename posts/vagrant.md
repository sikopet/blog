(Up-to-date [source](https://github.com/jreisinger/blog/blob/master/posts/vagrant.md) of
this post.)

[Search](https://atlas.hashicorp.com/boxes/search) and add a box (virtual machine image):

    vagrant box add https://atlas.hashicorp.com/ubuntu/boxes/trusty64
 
* added box is global to the vagrant install
* this is the *base* box (used to start the VM from the clean state)
* base boxes are stored in `~/.vagrant.d/boxes`

Initialize vagrant environment:

    mkdir ubuntu-trusty64
    cd ubuntu-trusty64
    vagrant init ubuntu/trusty64
    
* `Vagrantfile` is created

Start vagrant environment:

    vagrant up

* vagrant "imports" (copies) the base box to provider specific location (ex. `~/.VirtualBox`)

Check box(es) status:

    vagrant status
    
Check box(es) SSH configuration:

    vagrant ssh-config

Ssh to a box:

    vagrant ssh

Clean up:

    # save VM's state; fastest to start again; eats most diskspace (hard disk + saved state of RAM)
    vagrant suspend

    # graceful shutdown; slower to start again, still eats disk space (hard disk)
    vagrant halt

    # power down and remove all of the guest hard disks; even slower to
    # start again (reimport of the base box and reprovisioning)
    vagrant destroy

Show status of all vagrant environments on the host (independent of the directory you're in):

    vagrant global-status [--prune]

To share a folder from the host on the guest, add following to `Vagrantfile`:

    config.vm.synced_folder "../../eset-repos", "/shared/eset-repos",
      owner: "jreisinger", group: "jreisinger"

Vagrant in a proxy (corporate :-)) environment

     export http_proxy='http://user:password@host:port'
     export https_proxy='http://user:password@host:port'
    vagrant plugin install vagrant-proxyconf
    
     export VAGRANT_HTTP_PROXY='http://user:password@host:port'
    vagrant up

Resources
---------

* https://docs.vagrantup.com
* https://sysadmincasts.com/episodes/4-vagrant
* http://docs-v1.vagrantup.com/v1/docs/
