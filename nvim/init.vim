set nu
set nowrap
set foldmethod=indent
set mouse=a
set clipboard+=unnamedplus
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab



let g:NERDCreateDefaultMappings = 1
"let g:dashboard_default_executive ='telescope'

filetype plugin on
filetype indent on


inoremap fj <Esc>
inoremap jf <Esc>

noremap ; :
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


map <silent><leader>f :NERDTreeToggle<cr>
map <silent><c-l> :noh<cr>
map <silent><leader>t :lua require("FTerm").toggle()<cr>

tmap <silent><leader>t :<cmd>lua require("FTerm").toggle()<cr>

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

Plug 'preservim/nerdcommenter'

Plug 'neovim/nvim-lspconfig'

Plug 'itchyny/lightline.vim'

Plug 'terryma/vim-smooth-scroll'

Plug 'jiangmiao/auto-pairs'

Plug 'kyazdani42/nvim-web-devicons' " for file icons

Plug 'ryanoasis/vim-devicons'
"
"Plug 'kyazdani42/nvim-tree.lua' 
"
Plug 'joshdick/onedark.vim'

Plug 'numtostr/FTerm.nvim'

call plug#end()

colorscheme onedark
let g:airline_theme='onedark'

lua require('FTerm').setup()


