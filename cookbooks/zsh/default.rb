package 'zsh'

dotfile '.zsh'
dotfile '.zshrc'
dotfile '.zshenv'

execute "curl -fsSL https://starship.rs/install.sh | bash -s -- -f -b #{ENV['HOME']}/bin" do
  user node[:user]
  not_if "test -f #{ENV['HOME']}/bin/starship"
end

execute "chsh -s /usr/bin/zsh #{node[:user]}" do
  user 'root'
  only_if "getent passwd #{node[:user]} | cut -d: -f7 | grep -q '/bin/bash$'"
end
