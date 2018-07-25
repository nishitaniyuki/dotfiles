package 'git'

dotfile '.gitconfig'
dotfile '.gitconfig.darwin' if node[:platform] == 'darwin'
