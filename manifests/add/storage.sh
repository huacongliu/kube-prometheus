#!/bin/bash

nfs_store() {
###启用nfs存储
echo "启用nfs存储"
cd nfs-client
sh install.sh
cd ..
}


nfs_store
