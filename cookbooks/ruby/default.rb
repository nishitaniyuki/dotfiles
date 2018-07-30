execute "wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash" do
  user node[:user]
  not_if "test -f #{ENV['HOME']}/.rbenv/README.md || test -f ~/.rbenv/README.md"
end
