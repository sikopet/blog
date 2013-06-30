# Virtual Machines Management
###### linux

## libvirt + KVM

List VMs

    virsh -c qemu:///system list --all

Install VM

    virt-install \
                 --name vm01 \
                 --ram 256 \
                 --disk /images/vm/vm01.qcow2,size=10 \
                 --cdrom /images/iso/debian-6.0.6-amd64-netinst.iso \
                 --os-variant debiansqueeze \
                 --connect qemu:///system \
                 --virt-type kvm \
                 --network bridge=br0 \
                 --vnc \
                 --prompt
                 
* double check the first 5 parameters (`--name` to `--os-variant`)
* only `qcow2` disk supports [snapshotting](http://wiki.libvirt.org/page/VM_lifecycle#Taking_a_Snapshot_of_a_guest_domain)
* if runing from Windows [via putty](http://www.math.umn.edu/systems_guide/putty_xwin32.html):
 1. Install and start Xming (Xming Server:0.0) - you don't need to be admin
 1. Setup putty
            Enable X11 forwarding
            X display location: localhost:0

Stop VM

    virsh -c qemu:///system shutdown vm01

.. or
    
    virsh -c qemu:///system destroy vm01

Remove VM

    virsh -c qemu:///system undefine vm01
