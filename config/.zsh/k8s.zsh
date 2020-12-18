k() {
  if [[ $# -gt 0 ]]; then
    kubectl "$@"
  else
    kubectl config current-context
  fi
}
compdef k=kubectl