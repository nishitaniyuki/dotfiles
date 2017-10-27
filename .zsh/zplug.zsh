zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "b4b4r07/enhancd", use:init.sh

# zplug "junegunn/fzf-bin", \
#   as:command, \
#   from:gh-r, \
#   use: "*darwin*amd64*", \
#   rename-to:"fzf", \
#   frozen:1

