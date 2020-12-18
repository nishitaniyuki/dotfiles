bindkey -e

for CONF in $(ls "${HOME}/.zsh/"); do
  source "${HOME}/.zsh/${CONF}"
done

source <(kubectl completion zsh)

export STARSHIP_CONFIG="${HOME}/.starship"
eval "$(starship init zsh)"