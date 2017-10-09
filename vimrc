set nocompatible
set hidden
" Use UTF-8 (required by YCM)
set encoding=utf-8
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
"Plugin 'jpo/vim-railscasts-theme'
Plugin 'sjl/badwolf'
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
" Enable a huge undo tree view
Plugin 'sjl/gundo.vim'
" Show which branch we're in
Plugin 'tpope/vim-fugitive'
" GO support
Plugin 'fatih/vim-go'
" Show indentation in a neat way
Plugin 'Yggdroot/indentLine'
" Find files in a better way
Plugin 'ctrlpvim/ctrlp.vim'
" Comment lines out in an easier way
Plugin 'scrooloose/nerdcommenter'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
 
set foldmethod=syntax
syntax on

if !has("gui_running") && has("win32")
	set term=xterm
	set t_Co=256
	let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"

	"This is to fix a windows issue where backspace is mapped to delete
	"when using term=xterm
	"https://github.com/Maximus5/ConEmu/issues/641
	"If you have backspace issues, this is probably why
	inoremap <Char-0x07F> <BS>
	nnoremap <Char-0x07F> <BS>
endif

colorscheme badwolf
set cursorline
" Make the indentation indicators grayish
let g:indentLine_color_term = 239
set lazyredraw
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
let g:airline#extensions#tabline#fnamemod = ':t'
" Stop vim-go from autofolding on save
let g:go_fmt_autosave = 0
" No backups or swaps, yolo
set nobackup
set noswapfile

set wildmenu
set showmatch
set incsearch
set hlsearch
" Wait 100ms for key combinations
set ttimeoutlen=100
let mapleader=","
" Move faster up, down with J,K (NB the caps)
nnoremap J 3j
nnoremap K 3k
" save a session via ,s Reopen via "vim -S"
nnoremap <leader>s :mksession!<CR>
" Use ,l to close the syntastic error box
nnoremap <leader>l :lclose<CR>
" Use ,u to enable a big undo tree
nnoremap <leader>u :GundoToggle<CR>
" Use ,gc to run go linter
nnoremap <leader>gc :GoMetaLinter<CR>
" Use ,gb to build go file
nnoremap <leader>gb :GoBuild<CR>
" Use ,gf to format go file
nnoremap <leader>gf :GoFmt<CR>
" Use ,p to fuzzy find files
nnoremap <leader>p :CtrlP<CR>
" Use ,o to fuzzy find buffers
nnoremap <leader>o :CtrlPBuffer<CR>
" Use ,b to open the most recent buffer
nnoremap <leader>b :b#<CR>
" Use gb to move one buffer to the right
nnoremap gb :bnext<CR>
" Use gB to move a buffer to the left
nnoremap gB :bprevious<CR>
" Use ,q to close the current buffer
nmap <leader>q :bp <BAR> bd #<CR>
" Use ,h to clear highlighting
:nnoremap <silent><expr> <leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n" 
" space to toggle folding
nnoremap <space> za
" s to toggle comment
map s <plug>NERDCommenterToggle
" Use ,r to rename word under caret
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
" Use gV to highlight the last inserted text
nnoremap gV `[v`]
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

" VsVim settings
map gi :vsc Edit.GoToImplementation<CR>
map gr :vsc Edit.FindAllReferences<CR>
map gp :vsc Edit.PeekDefinition<CR>
nnoremap <leader>m :vsc Edit.NextMethod<cr>
nnoremap <leader>l :vsc Edit.PreviousMethod<cr>
nnoremap R :vsc Refactor.Rename<cr>
nnoremap <leader>e :vsc View.NextError<cr>
nnoremap <leader>E :vsc View.PreviousError<cr>
nnoremap cia :vsc Refactor.ReorderParameters<cr>


" Disable YouCompleteMe previw box popping up in the top
set completeopt-=preview
" CtrlP fuzzy file finding
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.dll     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = 'git\|DS_Store\|node_modules\|hg\|svn'
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':      ['<bs>', '<c-]>', '<c-h>'],
    \ 'PrtCurLeft()': ['<left>', '<c-^>'],
    \ }
" Syntastic syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "!level": "errors", "type": "style" }
" Show only the errors
let g:syntastic_stl_format = "%e errs, :%fe"
" Don't show warnings
let g:airline_section_warning = ""

" Default tabs/spaces
set tabstop=4
set shiftwidth=4
set expandtab
"Python specific settings with tabs
autocmd FileType python set tabstop=4 |set shiftwidth=4|set expandtab
"Javascript specific settings
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
