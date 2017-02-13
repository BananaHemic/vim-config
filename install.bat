echo "TODO check for prereqs"
REM Add a symlink to the vimrc
del %USERPROFILE%\_vimrc
mklink %USERPROFILE%\_vimrc %cd%\vimrc 
REM install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%\vimfiles\bundle\Vundle.vim
vim +PluginInstall +qall
REM Install YouCompleteMe
python %USERPROFILE%\vimfiles\bundle\YouCompleteMe\install.py --clang-completer

