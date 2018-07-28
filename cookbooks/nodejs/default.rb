NVM_VERSION = 'v0.33.11'

execute "curl -o- https://raw.githubusercontent.com/creationix/nvm/#{NVM_VERSION}/install.sh | bash" do
  user node[:user]
  not_if "test -f #{ENV['HOME']}/.nvm/README.markdown"
end
