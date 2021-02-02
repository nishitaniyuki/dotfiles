execute "git clone https://github.com/rbenv/rbenv.git ~/.rbenv" do
    user node[:user]
    not_if "test -d #{ENV['HOME']}/.rbenv"
end

execute "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | PATH=${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH} bash" do
    user node[:user]
    not_if "test -f #{ENV['HOME']}/.rbenv/plugins/ruby-build/bin/rbenv-install"
end
