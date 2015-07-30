#!/bin/sh
# You can optionally connect to the VM with
# virt-viewer -c qemu:///system OS
export OS=$1

virt-install --connect qemu:///system \
 --virt-type kvm \
 --name ${OS} \
 --os-variant debianwheezy \
 --file /var/lib/libvirt/images/${OS}.qcow2 \
 --ram 1024 \
 --vcpus 1 \
 --file-size=8 \
 --graphics none \
 --console pty,target_type=serial \
 --location http://http.debian.net/debian/dists/stable/main/installer-amd64/ \
 --network bridge=br0 \
 --extra-args "console=ttyS0,115200n8 serial auto=true hostname=${OS} domain= url=https://raw.githubusercontent.com/surcouf/chaos/master/preseed.txt text"
