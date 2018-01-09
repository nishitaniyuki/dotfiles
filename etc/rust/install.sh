#!/bin/bash

# install Rust if not installed
if [ ! $(which rustc) ]; then
  curl https://sh.rustup.rs -sSf | sh
fi

# install Rust packages
packages=(
  fd-find
  ripgrep
)
for pkg in ${packages[@]}
do
  cargo install $pkg
done
