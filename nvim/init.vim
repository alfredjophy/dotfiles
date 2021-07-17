set nu
set expandtab
set nowrap
set foldmethod=indent
set mouse=a
set clipboard+=unnamedplus

let g:NERDCreateDefaultMappings = 1

filetype plugin on

noremap ; :
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


map <silent><leader>f :NvimTreeToggle<cr>
map <silent><c-l> :noh<cr>


call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'itchyny/lightline.vim'

Plug 'terryma/vim-smooth-scroll'

Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdcommenter'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons

Plug 'kyazdani42/nvim-tree.lua'

Plug 'joshdick/onedark.vim'

call plug#end()

colorscheme onedark
let g:airline_theme='onedark'
