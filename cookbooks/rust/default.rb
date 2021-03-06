execute "curl https://sh.rustup.rs -sSf | sh -s -- -y" do
  user node[:user]
  not_if "test -f #{ENV['HOME']}/.cargo/bin/rustc"
end

package 'cmake' if node[:platform] == 'darwin'

["rustfmt", "clippy"].each do |component|
  execute "#{ENV['HOME']}/.cargo/bin/rustup component add #{component}" do
    user node[:user]
    not_if %Q[#{ENV['HOME']}/.cargo/bin/rustup component list | grep "^#{component} "]
  end
end

["fd-find", "ripgrep"].each do |pkg|
  execute "#{ENV['HOME']}/.cargo/bin/cargo install --verbose #{pkg}" do
    user node[:user]
    not_if %Q[#{ENV['HOME']}/.cargo/bin/cargo install --list | grep "^#{pkg} "]
  end
end
