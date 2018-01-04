#!/bin/bash
# This is not a production feature: Use kubernetes-managed volumes instead!
sudo apt-get -y install nfs-common
sudo mkdir -p /nfs/Ellie
sudo mount 192.168.1.114:/shares/Ellie /nfs/Ellie
