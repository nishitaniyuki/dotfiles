package 'vim'

dotfile '.vimrc'

execute 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' do
  user node[:user]
  not_if "test -f #{ENV['HOME']}/.vim/autoload/plug.vim"
end
