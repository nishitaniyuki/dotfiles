export GOVERSION=$(cat ${HOME}/.go/.goversion)
export GOROOT=${HOME}/.go/${GOVERSION}
export GOPATH=${HOME}
export PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH}
