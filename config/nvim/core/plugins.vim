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

    " Julia
    Plug 'JuliaEditorSupport/julia-vim'

    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'

    " Colorschemes
    Plug 'sainnhe/everforest'
    Plug 'joshdick/onedark.vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'ayu-theme/ayu-vim'
    Plug 'haishanh/night-owl.vim'
call plug#end()

" Slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
