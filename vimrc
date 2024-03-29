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
" Allow a right side bar of the code
Plugin 'majutsushi/tagbar'
" Railscasts for cool colors
"Plugin 'jpo/vim-railscasts-theme'
Plugin 'sjl/badwolf'
" Another color scheme
Plugin 'altercation/vim-colors-solarized'
" Better python folding
Plugin 'tmhedberg/SimpylFold'
" Syntax checking
Plugin 'dense-analysis/ale'
" Neat 'ol status bar
Plugin 'bling/vim-airline'
" Add indicators to the left for edited lines
Plugin 'mhinz/vim-signify'
" Themes for the status bar
"Plugin 'vim-airline/vim-airline-themes'
" Enable a huge undo tree view
Plugin 'sjl/gundo.vim'
" Show which branch we're in
Plugin 'tpope/vim-fugitive'
" GO support
"Plugin 'fatih/vim-go'
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
:so ~/_vimcommon
 
set foldmethod=syntax
syntax on

if !has("gui_running") && has("win32")
    set term=xterm
    set termencoding=utf-8
    set t_Co=256
	" Background/ foreground color
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"

	"This is to fix a windows issue where backspace is mapped to delete
	"when using term=xterm
	"https://github.com/Maximus5/ConEmu/issues/641
	"If you have backspace issues, this is probably why
    "inoremap <Char-0x07F> <BS>
    "nnoremap <Char-0x07F> <BS>
	
	"This fix is for the arrow keys + backspace in ConEmu
	"https://github.com/Maximus5/ConEmu/issues/1900
	let &t_kb="\xcex"
	let &t_kD="\xceS"
	
	let &t_ku="\xceH"
	let &t_kd="\xceP"
	let &t_kl="\xceK"
	let &t_kr="\xceM"
endif

colorscheme badwolf
set cursorline
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

" Make the indentation indicators grayish, and set it to a utf-8 friendly char
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
" Always show the statusbar
set laststatus=2
" Show the buffers, even if we only have one
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" Use ascii symbols b/c windows compatibility
let g:airline_symbols_ascii = 1
let g:airline_section_y = '#%{bufnr("%")}'
" Function to get the two containing directories as a string
function! GetContainingFolders()
    let wd = getcwd()
    let wd = join(split(wd, "\\")[-2:], "\\")
    return wd
endfunction
let g:airline_section_x = '%{GetContainingFolders()}'
let g:airline_section_z = '%p%%'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
" We only use git here
let g:signify_vcs_list               = [ 'git' ]
" Use these symbols for signify
let g:signify_sign_show_text         =  1
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = 'x'
let g:signify_sign_delete_first_line = 'X'
let g:signify_sign_change            = '~'
" Color the left signs
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
" Stop vim-go from autofolding on save
let g:go_fmt_autosave = 0
" Stop vim-go from adding crazy mappings
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
" No backups or swaps, yolo
set nobackup
set noswapfile

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
" Use ,q to close the open buffer
nmap <leader>q :bp <BAR> bd #<CR>
" Use ,h to clear highlighting
nnoremap <silent><expr> <leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n" 
" Use ,t to open the tagbar toggle
nnoremap <leader>t :TagbarToggle<CR>
" Use gb to move one buffer to the right
nnoremap gb :bnext<CR>
" Use gB to move a buffer to the left
nnoremap gB :bprevious<CR>
" Also use space to toggle in tagbar
let g:tagbar_map_togglefold = "<Space>"
" s to toggle comment
map s <plug>NERDCommenterToggle
" Use ,r to rename word under caret
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
" Use gV to highlight the last inserted text
nnoremap gV `[v`]
" Hit F2 to toggle pasting mode, which lets you enter text without weird
" formatting
set pastetoggle=<F2> 
" Let's not use arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" ex command for toggling hex mode - define mapping if desired 
command -bar Hex call ToggleHex()  
" helper function to toggle hex mode
function ToggleHex()
    " hex mode should be considered a read-only operation
    " save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        " save old options
        let b:oldft=&ft
        let b:oldbin=&bin
        " set new options
        setlocal binary
        " make sure it overrides any textwidth, etc.
        silent :e " this will reload the file without trickeries
        "(DOS line endings will be shown entirely)
        let &ft="xxd"
        " set status
        let b:editHex=1
        " switch to hex editor
        %!xxd
    else
        " restore old options
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        " set status
        let b:editHex=0
        " return to normal editing
        %!xxd -r
    endif
    " restore values for modified and read only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction
