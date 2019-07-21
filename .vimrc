call plug#begin('~/.vim/plugged')

Plug 'davidklsn/vim-sialoquent'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug '~/.vim/plugged/nord-light-vim'
Plug '~/.vim/plugged/vim-sialoquent-light'
Plug 'farmergreg/vim-lastplace'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug '~/.vim/plugged/ursamajor-vim'
Plug '~/.vim/plugged/ursamajorrev'
call plug#end()

" Colorscheme
set termguicolors
"colorscheme sialoquent
colorscheme ursamajor2
let g:lightline = {
      \ 'colorscheme': 'sialoquent',
      \ }
set nu
highlight CursorLine guibg=NONE
highlight CursorLineNr gui=NONE guifg=#ECE1C8
highlight Normal guibg=NONE
set cursorline

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set splitright
set splitbelow

map 0 ^

autocmd FileType tex setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.toml set syntax=conf
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk<Paste>

set undofile
set undodir=~/.vim/undodir

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
