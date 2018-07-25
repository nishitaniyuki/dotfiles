package 'zsh'

dotfile '.zsh'
dotfile '.zshrc'
dotfile '.zshenv'

execute 'curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh' do
  user node[:user]
  not_if "test -f #{ENV['HOME']}/.zplug/README.md"
end

execute "chsh -s /usr/bin/zsh #{node[:user]}" do
  only_if "getent passwd #{node[:user]} | cut -d: -f7 | grep -q '/bin/bash$'"
  user 'root'
end
