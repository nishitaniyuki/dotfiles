export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'


function fzf-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
    grep -v "ls" | \
    eval $tac | \
    fzf --no-sort --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N fzf-select-history

function fzf-move-repo () {
  local selected_dir=$(ghq list | fzf --exact --no-sort --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${HOME}/src/${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-move-repo

function fzf-git-branch-checkout() {
  local selected_branch_name="$(git branch -a | fzf | tr -d ' ')"
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
zle -N fzf-git-branch-checkout

bindkey '^r' fzf-select-history
bindkey '^]' fzf-move-repo
bindkey '^g^b' fzf-git-branch-checkout