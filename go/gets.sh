#!/bin/bash

set -e

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
    go get -u -v $pkg
done
