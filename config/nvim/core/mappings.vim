" Leader key
let g:mapleader =  ','

" Search Status
nnoremap <silent><Leader><space> :AnzuClearSearchStatus<BAR>noh<CR>
nmap n <Plug>(anzu-n)zz
nmap N <Plug>(anzu-N)zz
map * <Plug>(asterisk-z*)<Plug>(anzu-update-search-status)
map # <Plug>(asterisk-z#)<Plug>(anzu-update-search-status)
map g* <Plug>(asterisk-gz*)<Plug>(anzu-update-search-status)
map g# <Plug>(asterisk-gz#)<Plug>(anzu-update-search-status)

" Git
nnoremap <silent><Leader>G :vert G<CR>

" Commenting
nmap <Leader>c gcc

" Splitting
nnoremap <Leader>v <C-w>v
nnoremap <Leader>s <C-w>s

" Move lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Toggle between last two buffers
nnoremap <Leader><tab> <c-^>

" Disable ex mode
map Q <Nop>

" Buffer switching
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nmap <Leader>b :Buffers<CR>

" Files
nnoremap <Leader>f :Files<CR>
