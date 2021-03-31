k() {
  if [[ $# -gt 0 ]]; then
    kubectl "$@"
  else
    kubectl config current-context
  fi
}
compdef k=kubectl

k3() {
  if [[ $# -gt 0 ]]; then
    kubectl --kubeconfig /etc/rancher/k3s/k3s.yaml "$@"
  else
    kubectl --kubeconfig /etc/rancher/k3s/k3s.yaml config current-context
  fi
}
compdef k3=kubectl