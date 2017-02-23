set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
if has("win32")
	set rtp+=$HOME/vimfiles/bundle/Vundle.vim
	call vundle#begin('$HOME/vimfiles/bundle')
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif

" Use Vundle to manage the plugins
Plugin 'VundleVim/Vundle.vim'
" Syntax completion
Plugin 'Valloric/YouCompleteMe'
" Railscasts for cool colors
Plugin 'jpo/vim-railscasts-theme'
" Another color scheme
Plugin 'altercation/vim-colors-solarized'
" Better python folding
Plugin 'tmhedberg/SimpylFold'
" Syntax checking
Plugin 'scrooloose/syntastic'
" Neat 'ol status bar
Plugin 'bling/vim-airline'
" Show what is in the buffers
Plugin 'bling/vim-bufferline'
" Themes for the status bar
Plugin 'vim-airline/vim-airline-themes'
" Show which branch we're in
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
 
set foldmethod=syntax
syntax on
colorscheme desert
" make the backspace more natural
set backspace=indent,eol,start
" Show line numbers
set number
" Move between splits using Ctrl & h,j,k,l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Always show the statusbar
set laststatus=2
" Show the buffers, even if we only have one
let g:airline#extensions#tabline#enabled = 1
" No backups or swaps, yolo
set nobackup
set noswapfile
" Hit F2 to toggle pasting mode, which lets you enter text without weird
" formatting
set pastetoggle=<F2> 
" Use ; instead of :
nnoremap ; :
" Let's not use arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Syntastic syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "!level": "errors", "type": "style" }
" Show only the errors
let g:syntastic_stl_format = "%e errs, :%fe"
" Don't show warnings
let g:airline_section_warning = ""



