echo "TODO check for prereqs"
REM Add a symlink to the vimrc
del %USERPROFILE%\_vimrc
del %USERPROFILE%\_vsvimrc
del %USERPROFILE%\_vimcommon
mklink %USERPROFILE%\_vimrc %cd%\vimrc 
mklink %USERPROFILE%\_vsvimrc %cd%\vsvimrc 
mklink %USERPROFILE%\_vimcommon %cd%\vimcommon
REM install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%\vimfiles\bundle\Vundle.vim
vim +PluginInstall +qall
vim +GoInstallBinaries
REM Install YouCompleteMe
python %USERPROFILE%\vimfiles\bundle\YouCompleteMe\install.py --clang-completer --gocode-completer
REM Install syntastic checker
pip install pylint
