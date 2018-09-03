execute "curl https://sh.rustup.rs -sSf | sh -s -- -y" do
  user node[:user]
  not_if "test -f #{ENV['HOME']}/.cargo/bin/rustc"
end

["fd-find", "ripgrep", "bat"].each do |pkg|
  execute "#{ENV['HOME']}/.cargo/bin/cargo install --verbose #{pkg}" do
    user node[:user]
    not_if %Q[#{ENV['HOME']}/.cargo/bin/cargo install --list | grep "^#{pkg} "]
  end
end
