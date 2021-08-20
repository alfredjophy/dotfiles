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
set shell=dash
set completeopt=menu,preview
set termguicolors

filetype plugin on
filetype indent on

syntax on

inoremap <silent>fj <Esc>
inoremap <silent>jf <Esc>
inoremap <expr> <Tab> pumvisible() ? '<C-N>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-P>' : '<Tab>'
inoremap <silent>fjv <Esc>v
inoremap <silent>jfv <Esc>v

noremap ; :
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

map <silent><leader>f :NvimTreeToggle<cr>
map <silent><c-l> :noh<cr>
map <silent><leader>t :lua require("FTerm").toggle()<cr>

tmap <silent><leader>t <cmd>lua require("FTerm").toggle()<cr>

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdcommenter'

Plug 'neovim/nvim-lspconfig'

Plug 'terryma/vim-smooth-scroll'

Plug 'jiangmiao/auto-pairs'

Plug 'joshdick/onedark.vim'

Plug 'numtostr/FTerm.nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons

Plug 'kyazdani42/nvim-tree.lua'

Plug 'akinsho/nvim-bufferline.lua'

Plug 'hoob3rt/lualine.nvim'

Plug 'onsails/lspkind-nvim'

call plug#end()

colorscheme onedark

lua << END
require('lualine').setup{options = {theme = 'onedark'}}
require('FTerm').setup()
require('bufferline').setup()
END

" autocommand
autocmd VimEnter * :NvimTreeToggle
autocmd VimEnter * :wincmd p
