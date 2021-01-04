GO_VERSION = '1.13.6'

directory "#{ENV['HOME']}/.go/#{GO_VERSION}" do
  owner node[:user]
end

execute "curl http://storage.googleapis.com/golang/go#{GO_VERSION}.#{node[:os]}-amd64.tar.gz | tar xvzf - -C #{ENV['HOME']}/.go/#{GO_VERSION}/ --strip-components=1" do
  user node[:user]
  not_if "test -f #{ENV['HOME']}/.go/#{GO_VERSION}/README.md"
end

file "#{ENV['HOME']}/.go/.goversion" do
  owner node[:user]
  content GO_VERSION
end

[
  # General usage
  'github.com/junegunn/fzf',
  'github.com/motemen/ghq',
  # Golang dev
  'golang.org/x/tools/cmd/goimports',
  'honnef.co/go/tools/cmd/staticcheck'
  'golang.org/x/tools/gopls@latest',
].each do |pkg|
  execute "GOPATH=#{ENV['HOME']} #{ENV['HOME']}/.go/#{GO_VERSION}/bin/go get -u #{pkg}" do
    user node[:user]
    not_if "test -d #{ENV['HOME']}/src/#{pkg}"
  end
end
