#!/bin/bash
yum -y install rpcbind nfs-utils
systemctl start rpcbind
systemctl enable rpcbind
systemctl start nfs-server
systemctl enable nfs-server

mkdir /k8s/nfs -p
echo "/k8s/nfs *(rw,async,no_root_squash)" >/etc/exports
systemctl reload nfs 
exportfs -rv
