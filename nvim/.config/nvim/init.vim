" Vimrc file for Rolfe Power

call plug#begin()

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'JuliaEditorSupport/julia-vim'

call plug#end()

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Do not use conceal feature
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Search down into subfolders
set path+=**

" Increase the undo limit
set history=500

" Check the filetype being edited and use that indent scheme
filetype plugin on
filetype indent on

" Keep the cursor in the middle of the screen when possible
" set so=999

" Allow tab completion menu to show up showing possibilities
set wildmenu

" Display line numer information
set ruler

" Enable code folding
set foldmethod=indent
set foldlevel=99
nnoremap <tab> za

" Make backspace work like it should
set backspace=eol,start,indent

" Wrap lines on cursor keys
set whichwrap+=<,>,h,l

" Ignore case when searching with all lowers, but not when include uppers
set ignorecase
set smartcase

" Highlight the search results
set hlsearch

" Begin searching when letters are typed
set incsearch

" Show the matching bracket when a bracket is inserted if on screen
set showmatch
set mat=2

" No sound or flash every 3 god-damn seconds
set noerrorbells
set visualbell
set t_vb=

" Enable syntax highlighting
syntax enable

" Visual crap
" colorscheme base16-tomorrow-night
" set background=dark

" No one uses tabs, replaces with spaces 
set expandtab

" Backspace will delete 4 spaces if they were inserted on a tab
set smarttab

" Tabs are four spaces. Period.
set shiftwidth=4
set tabstop=4

" Automatically copies current indentation 
set ai

" Indents correctly on (most) programs
set si

" Wraps lines too long to read. Does not change actual text buffer.
set wrap

" Search with space because ain't nobody want arthritis from hitting / all the
" time
map <space> /

" Display the number of steps away from the current line every other visible
" line is
set relativenumber

" Display the line number of the current line
set number

" You get a status line, you get a status line, everybody gets a status line
set laststatus=2

" Format the status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

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

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set encoding=utf-8



