#!/bin/bash

DOTPATH="${HOME}/src/github.com/nishitaniyuki/dotfiles"
DOTFILES=$(ls -a $DOTPATH | sed -e "s/\///" | grep -E "^\..*$" | grep -v -E "^(\.|\.\.|\.git|\.DS_Store)$")
for f in ${DOTFILES}; do
  if [ -L ${HOME}/${f} ]; then
    echo "link ${HOME}/${f} already exists"
  else
    ln -s ${DOTPATH}/${f} ${HOME}/${f}
  fi
done

SETUP_LIST=(
  packages
  go
  rust
  tmux
  vim
)
for i in ${SETUP_LIST[@]}; do
  echo "---> Install ${i} and related"
  ${DOTPATH}/etc/${i}/install.sh
done
