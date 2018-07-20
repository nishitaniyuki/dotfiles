#!/bin/bash

install_darwin_packages() {
  # install Homebrew if not installed
  if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # update Homebrew recipes
  printf "update recipes? [y/n]: " && read ANS
  if [ "${ANS}" = "y" ]; then
    brew upgrade
  fi

  # tap repositories
  repositories=(
    sanemat/font
  )
  brew tap ${repositories[@]}

  # install packages
  packages=(
    # editor
    vim

    # font
    ricty

    # git
    git
    hub
    tig

    # languages
    gcc

    # multiplexe
    tmux

    # shell
    zsh

    # utils
    autoconf
    automake
    curl
    coreutils
    direnv
    findutils
    rmtrash
    tree
    wget
  )
  brew install ${packages[@]} && brew cleanup
}

install_linux_packages() {
  packages=(
    clang
    lldb
  )
  sudo apt-get update
  sudo apt-get install ${packages[@]}
}

if [ `uname` = "Darwin" ]; then
  install_darwin_packages
elif [ `uname` = "Linux" ]; then
  install_linux_packages
fi
