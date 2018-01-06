#!/bin/bash

# kubernetes requires swaps to be off
sudo swapoff -av

# This reset former 'init' settings, if there were any
sudo kubeadm reset

# Initially, the following kubeadm init failed with because swap was on
# I commented the corresponding swap entry in /etc/fstab, like so:
# sudo sed -i '/ swap / s/^/#/' /etc/fstab
# then restarted the physical machine and afterwards also did:
# sudo swapoff -av
# Then it worked. But that may not be without penalty
# see: https://askubuntu.com/questions/214805/how-do-i-disable-swap
sudo kubeadm init
rm -rf $HOME/.kube
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# this should be in ~/.bash_profile, too
export KUBECONFIG=$HOME/.kube/config

# setup weaveworks networking
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"

watch -n 1 kubectl get pods --all-namespaces
