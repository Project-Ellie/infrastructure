#!/bin/bash
# deploy the dashboard
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

# provide it with admin rights. (DON'T USE IN PROD)
kubectl create -f dashboard-admin.yml

# start the proxy on the client like
# nohup kubectl proxy
