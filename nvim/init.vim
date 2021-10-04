set nu
set nowrap
set mouse=a
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set clipboard+=unnamedplus
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set shell=dash
set completeopt=menu,preview
set termguicolors
set conceallevel=2
set cursorline
set updatetime=100
set undofile 
set smartcase

filetype plugin on
filetype indent on

syntax on

inoremap <expr> <Tab> pumvisible() ? '<C-N>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-P>' : '<Tab>'

noremap ; :
noremap G Gzz

map <silent><leader>f :NvimTreeToggle<cr>
map <silent><c-l> :noh<cr>
map <silent><leader>t :lua require("FTerm").toggle()<cr>
map <silent><leader>p :CocCommand prettier.formatFile<cr>
map <silent><leader>R :NvimTreeRefresh<cr>

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

Plug 'jdhao/better-escape.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'karb94/neoscroll.nvim'

call plug#end()

let g:better_escape_shortcut = ['fj','jf']

colorscheme onedark
highlight Comment cterm=italic gui=italic

lua << END
require('lualine').setup{options = {theme = 'onedark'}}
require('bufferline').setup()
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { "javascript" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,              -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
        custom_captures = {
             -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ["foo.bar"] = "Identifier",
        },
    },
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
            },
    },
}
require('neoscroll').setup({
-- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
            '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil,        -- Default easing function
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,              -- Function to run after the scrolling animation ends
    }
)
require'nvim-tree'.setup()
END

" autocommand
autocmd VimEnter * :NvimTreeToggle
autocmd VimEnter * :wincmd p

