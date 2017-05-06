" Vimrc file for Rolfe Power

set history=500

filetype plugin on
filetype indent on

set autoread

set so=8

set wildmenu

set ruler

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase

set smartcase

set hlsearch

set incsearch

set lazyredraw

set showmatch
set mat=2

set noerrorbells
set novisualbell

syntax enable
colorscheme desert
set background=dark

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set ai
set si
set wrap

map <space> /

set relativenumber
set number

set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    endif
    return ''
endfunction


" Improve the splitting behavior
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Disable the arrow keys (here we go)

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
