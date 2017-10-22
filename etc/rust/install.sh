#!/bin/bash

# install Rust if not installed
if [ ! $(which rustup) ]; then
  curl https://sh.rustup.rs -sSf | sh
fi

# install Rust packages
packages=(
  ripgrep
)
for pkg in ${packages[@]}
do
  cargo install $pkg
done
