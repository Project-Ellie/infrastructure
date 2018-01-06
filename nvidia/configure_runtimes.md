# Enabling nvidia runtime as default:
Follow https://github.com/NVIDIA/k8s-device-plugin
Manually, open /etc/docker/daemon.json to add 
```
 "default-runtime": "nvidia",
```
on top of the "runtimes" section

You may need to chmod the /etc/docker directory before you can cd into it.

# Enable the device plugin feature:
open /etc/systemd/system/kubelet.service.d/10-kubeadm.conf to add
```
Environment="KUBELET_EXTRA_ARGS=--feature-gates=DevicePlugins=true"
```
then reload and restart the kubelet like
```
$ sudo systemctl daemon-reload
$ sudo systemctl restart kubelet
```

Then head on to infrastructure/kubernets and run plugin.sh