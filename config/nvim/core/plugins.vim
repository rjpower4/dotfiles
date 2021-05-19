call plug#begin(stdpath('data') . '/plugged')
    " Commenting
    Plug 'tpope/vim-commentary'

    " Sandwich/Surround
    Plug 'machakann/vim-sandwich'

    " Version control
    Plug 'tpope/vim-fugitive'

    " Better star searching
    Plug 'haya14busa/vim-asterisk'

    " Search Status
    Plug 'osyo-manga/vim-anzu'

    " Fuzzy finding
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Jumping
    Plug 'pechorin/any-jump.vim'
    Plug 'unblevable/quick-scope'

    " Slime
    Plug 'jpalardy/vim-slime'

    " All Languages
    Plug 'sheerun/vim-polyglot'

    " Julia
    Plug 'JuliaEditorSupport/julia-vim'

    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'

    " LaTeX
    Plug 'lervag/vimtex'
call plug#end()

" Slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

" LaTeX
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
