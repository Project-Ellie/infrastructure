#!/bin/bash

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu16.04/amd64/nvidia-docker.list | \
    sudo sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2

# restart docker demon
sudo pkill -SIGHUP dockerd

# Test nvidia-smi with the latest official CUDA image
dockerrun --runtime=nvidia --rm nvidia/cuda:8.0 nvidia-smi
