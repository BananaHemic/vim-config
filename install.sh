#~/bin/bash
sudo apt-get install build-essential cmake python-dev python3-dev
ln -s ~/.vim/.vimrc ~/vimrc
cd ~/.vim
git submodule init
git submodule update --init --recursive
#install Vundle
vim +PluginInstall +qall
#Make sure we have node install for JS
type node >/dev/null 2>&1 || {echo "Will install node"; curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - sudo apt-get install -y nodejs;}
#Install YouCompleteMe
python ~/.vim/bundle/YouCompleteMe/install.py --tern-completer

