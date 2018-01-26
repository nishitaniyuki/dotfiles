#!/bin/bash

# install Go

export PLATFORM
if [ `uname` = "Darwin" ]; then
  PLATFORM="darwin"
elif [ `uname` = "Linux"]; then
  PLATFORM="linux"
fi

GOVERSION=${1}
if [ -z $GOVERSION ]; then
  GOVERSION=1.9.3
fi

if [ -d ${HOME}/.go/${GOVERSION} ]; then
  echo "${GOVERSION} is already installed"
else
  mkdir -p ${HOME}/.go/${GOVERSION}
  curl http://storage.googleapis.com/golang/go${GOVERSION}.${PLATFORM}-amd64.tar.gz | tar xvzf - -C ${HOME}/.go/${GOVERSION}/ --strip-components=1
  echo $GOVERSION > ${HOME}/.go/.goversion
fi

# install Go packages
packages=(
    # General usage
    github.com/motemen/ghq
    github.com/junegunn/fzf/...

    # Go cmd
    golang.org/x/tools/cmd/godoc
    golang.org/x/tools/cmd/goimports
    golang.org/x/tools/cmd/benchcmp
    golang.org/x/tools/cmd/present

    # Golang dev
    github.com/golang/lint/golint
    github.com/nsf/gocode
    github.com/rogpeppe/godef
    github.com/dougm/goflymake
    github.com/jstemmer/gotags
    github.com/k0kubun/pp
    github.com/tools/godep
    github.com/motemen/gore
    github.com/tcnksm/ghr
    github.com/tcnksm/gotests
)
for pkg in ${packages[@]}
do
  go get -v $pkg
done
