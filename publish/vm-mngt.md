# Virtual Machines Management
###### linux

Install (create) VM

    virt-install \
                 --name vm01 \
                 --ram 256 \
                 --disk /images/vm/vm01.qcow2,size=10 \
                 --cdrom /images/iso/debian-6.0.6-amd64-netinst.iso \
                 --os-variant debiansqueeze
                 --connect qemu:///system \
                 --virt-type kvm \
                 --network bridge=br0 \
                 --vnc \
                 --prompt \
                 
* double check the first 5 parameters (`--name` to `--os-variant`)

