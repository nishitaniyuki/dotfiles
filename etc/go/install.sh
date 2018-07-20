#!/bin/bash

# install Go

export PLATFORM
if [ `uname` = "Darwin" ]; then
  PLATFORM="darwin"
elif [ `uname` = "Linux" ]; then
  PLATFORM="linux"
fi

GOVERSION=${1}
if [ -z $GOVERSION ]; then
  GOVERSION=1.10.1
fi

if [ -d ${HOME}/.go/${GOVERSION} ]; then
  echo "${GOVERSION} is already installed"
else
  mkdir -p ${HOME}/.go/${GOVERSION}
  trap "rm -rf ${HOME}/.go/${GOVERSION} && rm -f ${HOME}/.go/.goversion" 1 2 3 15
  curl http://storage.googleapis.com/golang/go${GOVERSION}.${PLATFORM}-amd64.tar.gz | tar xvzf - -C ${HOME}/.go/${GOVERSION}/ --strip-components=1
  echo $GOVERSION > ${HOME}/.go/.goversion
  trap 1 2 3 15
fi

# install Go packages
packages=(
    # General usage
    github.com/junegunn/fzf/...
    github.com/motemen/ghq

    # Go cmd
    golang.org/x/tools/cmd/benchcmp
    golang.org/x/tools/cmd/godoc
    golang.org/x/tools/cmd/goimports
    golang.org/x/tools/cmd/present

    # Golang dev
    github.com/golang/lint/golint
    github.com/jstemmer/gotags
    github.com/motemen/gore
    github.com/nsf/gocode
)
for pkg in ${packages[@]}
do
  go get -u -v $pkg
done
