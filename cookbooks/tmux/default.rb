package 'tmux'

dotfile '.tmux.conf'
dotfile '.tmux.conf.darwin' if node[:platform] == 'darwin'

git "#{ENV['HOME']}/.tmux/plugins/tpm" do
  repository "https://github.com/tmux-plugins/tpm.git"
  user node[:user]
  not_if "test -f #{ENV['HOME']}/.tmux/plugins/tpm/README.md"
end
