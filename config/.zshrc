bindkey -e

source <(kubectl completion zsh)

for CONF in $(ls "${HOME}/.zsh/"); do
  source "${HOME}/.zsh/${CONF}"
done

export STARSHIP_CONFIG="${HOME}/.starship"
eval "$(starship init zsh)"