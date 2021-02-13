export GOVERSION="$(cat ${HOME}/.go/.goversion)"
export GOROOT="${HOME}/.go/${GOVERSION}"
export GOPATH="${HOME}/go"
export GO111MODULE="auto"
export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"