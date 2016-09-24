Hey! Welcome to my vim config repo.
It's just a simple way for me to syncronize my vim settings across multiple systems. It might not make sense for you to use this, as you'll probably want a configuration without the idiosyncracies of my vim preferences.

#Installation
git clone git://github.com/BananaHemic/vim-config.git ~/.vim
##Create sym links
ln -s ~/vim/vimrc ~/.vimrc
##Install submodules
cd ~/.vim
git submodule init
git submodule update
