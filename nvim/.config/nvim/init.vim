" Vimrc file for Rolfe Power

set nocompatible

filetype off

call plug#begin()
     "Plug 'itchyny/lightline.vim'
     Plug 'frazrepo/vim-rainbow'
     Plug 'scrooloose/nerdtree'
     Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
     Plug 'ryanoasis/vim-devicons'
     Plug 'jreybert/vimagit'
     Plug 'tpope/vim-surround'
     Plug 'vim-python/python-syntax'
     Plug 'junegunn/goyo.vim'
     Plug 'junegunn/limelight.vim'
     Plug 'junegunn/vim-emoji'
     "Plug 'crusoexia/vim-monokai'
     "Plug 'shinchu/lightline-gruvbox.vim'
     "Plug 'morhetz/gruvbox'
     Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

filetype plugin indent on 

let mapleader=","
set path+=**
set wildmenu
set incsearch
set hidden
set nobackup
set noswapfile
set t_Co=256
set number
set clipboard=unnamedplus
syntax enable
let g:rehash256 = 1

" Theme
" let base16colorspace=256 
set termguicolors
colors zenburn

" Status Line
let g:lightline = {}
" let g:lightline.colorscheme = 'gruvbox'
set laststatus=2
set noshowmode

" Tabbing
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

" Terminal
map <leader>tt :vnew term://zsh<CR>

" Mouse Scrolling
set mouse=nicr

" Splits
set splitbelow splitright

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

" Other
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()
