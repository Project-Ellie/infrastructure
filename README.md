# infrastructure
All code related to SWE infrastructure required for Ellie. This is particularly for my cluster setup. Inspect and adapt the scripts for your requirements

## Getting the Kubernetes cluster up and running

1) Install kubectl on the prospective mgmt client with the local package manager.
1) Use ```$ install_master.sh``` and install_worker.sh to install kubernetes nodes
1) Use ```$ init_master.sh``` to initialize the dedicated master node. 
1) Copy the master's .kube/config to the prospective client to support kubectl authentication (There must be a better way!)
1) Use ```$ joincmd.sh``` on the master to print out the statements needed to join a worker node
1) Execute those statemenents on each worker node
1) Use ```$ kubectl get nodes -w``` on the client to watch the nodes come up
1) Run ```$ setup_master.sh``` to install the dashboard 
1) Run ```$ kubectl proxy``` on the client - ideally in the background and point your browser to the the indicated port to access the dashboard

## Installing infrastructure services
### Jenkins CI/CD
Run ```$ kubectl apply -f blueocean``` to spin up a jenkins server on cluster port 31080. Note that in my setup, this creates an nfs-mounted persistent volume 

### Mongo DB
Run ```$ kubectl apply -f mongo``` to spin up a mongodb server on node port 30017 (use mongo-sv:27017 internally)

### Additional persistent volumes
1) Run ```$ kubectl apply -f persistent-volumes``` to create additional persistent volumes required for applications

