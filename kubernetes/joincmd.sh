echo "Use these commands on the worker host to join this cluster:"
echo sudo swapoff -av
echo sudo kubeadm reset
echo sudo $(sudo kubeadm token create --print-join-command)

echo "=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!"
echo
echo "Don't forget to 'kubectl label nodes <yournode> capability=gpu', if you want to attract GPU-aware pods"
echo
echo "=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!"