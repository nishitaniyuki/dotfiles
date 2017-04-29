# peco and history
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
    grep -v "ls" | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# ghq and peco
function peco-src () {
  local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# peco and git branch
function peco-git-branch-checkout() {
  local selected_branch_name="$(git branch -a | peco | tr -d ' ')"
  case "$selected_branch_name" in
    *-\>* )
      selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*->(.*?)\/(.*)$/\2/;print')";;
    remotes* )
      selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*?remotes\/(.*?)\/(.*)$/\2/;print')";;
  esac
  if [ -n "$selected_branch_name" ]; then
    BUFFER="git checkout ${selected_branch_name}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-git-branch-checkout
bindkey '^g^b' peco-git-branch-checkout

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# gvm
[[ -s "/Users/nishitani/.gvm/scripts/gvm" ]] && source "/Users/nishitani/.gvm/scripts/gvm"

# clojure
export PATH="$HOME/.lein:$PATH"

# cask
export PATH="$HOME/.cask/bin:$PATH"

# haskell
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# direnv
eval "$(direnv hook zsh)"

# android sdk
export ANDROID_HOME="$HOME/Library/android/sdk"

# depot_tools (for V8)
export PATH="$HOME/Applications/depot_tools:$PATH"

# calibre
export PATH="/Applications/calibre.app/Contents/console.app/Contents/MacOS:$PATH"

# Tex
export PATH="/Library/Tex/texbin:$PATH"

# Visual Studio Code
function code {
  if [[ $# = 0 ]]
  then
    open -a "Visual Studio Code"
  else
    local argPath="$1"
    [[ $1 = /* ]] && argPath = "$1" || argPath="$PWD/${1#./}"
    open -a "Visual Studio Code" "$argPath"
  fi
}

# Git
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}
compdef g=git
