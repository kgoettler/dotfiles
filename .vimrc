set runtimepath+=~/.vim
set nocompatible
" let $PATH .= ';C:\Users\kgoettler\cygwin64\bin'
set backupdir=~/.vim/backups

" General Settings
syntax enable
set hlsearch
set shell=bash\ --login
set undofile
set undodir=~/.vim/undo

" GUI Specific settings
if has('gui_running')
"    set guifont=Fira\ Code\ Medium:h10
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    au GUIEnter * simalt ~x
    "autocmd VimEnter * NERDTree
else
    set nocursorline
endif

" Main .vim files
call plug#begin('~/.vim/plugged')
    Plug 'davidklsn/vim-sialoquent'
    Plug 'itchyny/lightline.vim'
    Plug 'farmergreg/vim-lastplace'
    Plug 'scrooloose/nerdtree'
    Plug 'kgoettler/gruvbox'
    Plug 'pangloss/vim-javascript'
    Plug 'hdima/python-syntax'
    Plug 'tpope/vim-fugitive'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'arzg/vim-colors-xcode'
    Plug 'junegunn/goyo.vim'
    Plug 'rakr/vim-two-firewatch'
    Plug 'cespare/vim-toml'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'keith/swift.vim'
    Plug 'lervag/vimtex'
    Plug 'pprovost/vim-ps1'
    "Plug 'kgoettler/bullets.vim', {'for': 'markdown'}
    Plug 'rust-lang/rust.vim'
    Plug 'hashivim/vim-terraform'
    "Plug 'bfrg/vim-cpp-modern'
call plug#end()

" NERDTree config
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Python-syntax config
let python_highlight_all = 1
let python_highlight_space_errors=0

" Color scheme
set termguicolors
set background=dark
colorscheme gruvbox
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
" Gruvbox color fixing
highlight FoldColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
highlight EndOfBuffer ctermfg=black ctermbg=black guibg=NONE guifg=#282828
highlight CursorLine guibg=NONE
highlight CursorLineNr guibg=NONE
highlight link SpecialComment Comment
set fillchars+=vert:\ 
if has('gui_running')
    highlight CursorLineNr guifg=#EBCB8B
    set cursorline
endif

" StatusLine
set statusline=
set statusline+=\ %f
set statusline+=%=%m
set statusline+=\ \%{&fileformat}\ \|\ %y\ \|\ %l:%c
set laststatus=2

" Folding + Indentations
set foldlevelstart=1
set nofoldenable 
set nu
set breakindentopt=shift:4
set breakindent
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set cinoptions=4

" VQScript setup
au FileType javascript setlocal foldmethod=manual
au BufNewFile,BufRead *.vqs set filetype=javascript
au BufNewFile,BufRead *settings*.txt set filetype=python
au BufNewFile,BufRead *.jl set filetype=julia
au BufNewFile,BufRead *.md setlocal textwidth=80
au BufNewFile,BufRead *.rst setlocal textwidth=80

"au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" JSON/JS setup
au BufNewFile,BufRead *.json set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2
" Ignore the missing quotes on keywords in JSON
highlight link jsonNoQuotesError jsonKeyword

" TT setup
au BufNewFile,BufRead *.tt set filetype=tt2
au BufNewFile,BufRead *.inc set filetype=tt2

" Misc
map 0 ^
"inoremap # X#
"unmap <C-l>
"noremap! <C-l> :noh<CR>
:command BC :bp\|bd #<CR>
set splitright
set splitbelow

"let g:pyindent_open_paren=4
"let g:pyindent_open_paren = 'shiftwidth()'
"let g:pyindent_open_parm = 4
"let g:pyindent_nested_paren = 4
"let g:pyindent_continue = 4
let g:python_pep8_indent_hang_closing = 0

let g:python_host_prog  = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'

let g:tex_flavor="latex"

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
