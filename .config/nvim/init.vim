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
noremap dd "_dd

map <silent><leader>f <cmd>CHADopen<cr>
map <silent><c-l> :noh<cr>
map <silent><leader>t :lua require("FTerm").toggle()<cr>
map <silent><leader>R :NvimTreeRefresh<cr>

" Formatting options
map <silent><leader>p :echo "Formatter not specified!Doing gg=G"<cr>gg=G<cr>

autocmd fileType java map <silent><leader>p :%!astyle --style=java<cr>
autocmd fileType javascript,html,css,json,markdown,jsx  map <silent><leader>p :CocCommand prettier.formatFile<cr>
autocmd fileType c,cpp map <silent><leader>p :%!astyle<cr>
autocmd fileType rust map <silent><leader>p :%!rustfmt<cr>

tmap <silent><leader>t <cmd>lua require("FTerm").toggle()<cr>

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'preservim/nerdcommenter'

Plug 'neovim/nvim-lspconfig'

Plug 'terryma/vim-smooth-scroll'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'jiangmiao/auto-pairs'

Plug 'joshdick/onedark.vim'

Plug 'numtostr/FTerm.nvim'

Plug 'akinsho/nvim-bufferline.lua'

Plug 'hoob3rt/lualine.nvim'

Plug 'jdhao/better-escape.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'karb94/neoscroll.nvim'

Plug 'vim-pandoc/vim-pandoc'

Plug 'vim-pandoc/vim-pandoc-syntax' 

Plug 'mhinz/vim-startify'

Plug 'alvan/vim-closetag'

Plug 'editorconfig/editorconfig-vim'

call plug#end()

let g:better_escape_shortcut = ['fj','jf','FJ','JF']

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {'typescript.tsx': 'jsxRegion,tsxRegion','javascript.jsx': 'jsxRegion','typescriptreact': 'jsxRegion,tsxRegion','javascriptreact': 'jsxRegion'}
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

colorscheme onedark
highlight Comment cterm=italic gui=italic

lua << END
require('lualine').setup{options = {theme = 'onedark'}}
require('bufferline').setup()
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
require'colorizer'.setup({'*'},{RRGGBBAA=true,rgb_fn=true,hsl_fn=true,css=true,css_fn=true})
END
