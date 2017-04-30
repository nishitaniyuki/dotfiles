ZPLUG_PROTOCOL=ssh

zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

