GO_VERSION = '1.10.3'

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
  # Go cmd
  'golang.org/x/tools/cmd/benchcmp',
  'golang.org/x/tools/cmd/godoc',
  'golang.org/x/tools/cmd/goimports',
  'golang.org/x/tools/cmd/present',
  # Golang dev
  'github.com/golang/lint/golint',
  'github.com/jstemmer/gotags',
  'github.com/motemen/gore',
  'github.com/stamblerre/gocode'
].each do |pkg|
  execute "GOPATH=#{ENV['HOME']} #{ENV['HOME']}/.go/#{GO_VERSION}/bin/go get -u #{pkg}" do
    user node[:user]
    not_if "test -d #{ENV['HOME']}/src/#{pkg}"
  end
end
