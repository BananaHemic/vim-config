#~/bin/sh
if [ $(id -u) = 0 ]; then
    echo "Please do NOT run this as sudo"
    exit 1
fi
sudo apt-get install build-essential cmake python-dev python3-dev python3-pip
ln -s "$(pwd)/vimrc" ~/.vimrc
ln -s "$(pwd)/vsvimrc" ~/_vsvimrc
ln -s "$(pwd)/vimcommon" ~/_vimcommon
#install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
#Make sure we have node install for JS
type node >/dev/null 2>&1 || { echo "Will install node"; curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - sudo apt-get install -y nodejs;}
#Install YouCompleteMe
python ~/.vim/bundle/YouCompleteMe/install.py --tern-completer --clang-completer
#Install syntastic checker
pip3 install pylint
