set title                                                                       " Change the terminal's title
set number                                                                      " Line numbers
set relativenumber                                                              " Show numbers relative to current line
set cursorline                                                                  " Highlight current line
set smartcase                                                                   " Smart case search if there's an uppercase
set ignorecase                                                                  " Case insensitive search
set mouse=a                                                                     " Enable mouse
set showmatch                                                                   " Highlight matching bracket
set nostartofline                                                               " Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=0                                               " Reduce command time out for faster escape and O
set fileencoding=utf-8                                                          " Use UTF-8 encoding on write
set nowrap                                                                      " Do not wrap lines
set linebreak                                                                   " Wrap lines at convenient points
set listchars=tab:│\ ,trail:·                                                   " Set trails for tabs and spaces
set list                                                                        " Enable listchars
set lazyredraw                                                                  " Do not redraw registers and macros
set hidden                                                                      " Hide buffers in background
set splitright                                                                  " Vertical split to right
set splitbelow                                                                  " Horizontal split below
set grepprg=rg\ --smart-case\ --color=never\ --no-heading\ -H\ -n\ --column     " Use ripgrep for grepping
set tagcase=smart                                                               " Use smart case for tag searching
set updatetime=300                                                              " Cursor hold timeout
set undofile                                                                    " Keep updo history across sessions by storing in file
set noswapfile                                                                  " Disable creating swap file
set nobackup                                                                    " Disable saving backup file
set nowritebackup                                                               " Disable writing backup file
set fillchars+=vert:│                                                           " Use vertical line for vertical split
set breakindent                                                                 " Preserve indent on line wrap
set smartindent                                                                 " Use smarter indenting
set expandtab                                                                   " Use spaces for indentation
set shiftwidth=4                                                                " Use 4 spaces for indentation
set nofoldenable                                                                " Disable folding by default
set foldmethod=syntax                                                           " When folding enabled, use syntax method
set diffopt+=vertical                                                           " Always use vertical layout for diffs

set scrolloff=8                                                                 " Start scrolling when we're 8 lines away from margins
set sidescrolloff=8                                                             " Start scrolling when we're 15 lines away from sides
set sidescroll=5                                                                " Scroll L/R by 5 columns

set pyxversion=3                                                                " Use python 3
let g:python3_host_prog = '/usr/bin/python3'

augroup vimrc
    autocmd!
    autocmd InsertEnter * set nocul " Remove cursorline on insert mode
    autocmd InsertLeave * set cul
    autocmd FocusGained,BufEnter * silent! exe 'checktime' " Refresh file when focus gained
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

