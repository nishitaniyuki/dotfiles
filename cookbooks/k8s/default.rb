# TODO: support darwin
execute "curl -o #{ENV['HOME']}/bin/kubectl --create-dirs -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" do
  user node[:user]
  not_if "test -f #{ENV['HOME']}/bin/kubectl"
end

file "#{ENV['HOME']}/bin/kubectl" do
  action :edit
  mode '755'
end
