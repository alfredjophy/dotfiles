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
set shell=fish
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

noremap ; :
noremap G Gzz
noremap dd "_dd

nnoremap <A> i
imap <A> <Esc>

map <silent><leader>f <cmd>CHADopen<cr>
map <silent><c-l> :noh<cr>
map <silent><leader>t :ToggleTerm<cr>
map <silent><leader>R :NvimTreeRefresh<cr>
map <silent><leader>G :terminal lazygit<cr>


tmap <silent><leader>t <cmd>ToggleTerm<cr>

" Formatting options
map <silent><leader>p :CocCommand editor.action.formatDocument<cr>


"autocmd fileType java map <silent><leader>p :%!astyle --style=java<cr>
"autocmd fileType javascript,html,css,json,markdown,jsx  map <silent><leader>p :CocCommand prettier.formatFile<cr>
"autocmd fileType c,cpp,php map <silent><leader>p :%!astyle<cr>
"autocmd fileType rust map <silent><leader>p :%!rustfmt<cr>
autocmd FileType php set iskeyword+=$


call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'preservim/nerdcommenter'

Plug 'neovim/nvim-lspconfig'

Plug 'terryma/vim-smooth-scroll'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'jiangmiao/auto-pairs'

Plug 'olimorris/onedarkpro.nvim' 

Plug 'akinsho/nvim-bufferline.lua'

Plug 'hoob3rt/lualine.nvim'

Plug 'jdhao/better-escape.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'karb94/neoscroll.nvim'

Plug 'vim-pandoc/vim-pandoc'

Plug 'vim-pandoc/vim-pandoc-syntax' 

Plug 'mhinz/vim-startify'

Plug 'alvan/vim-closetag'

Plug 'akinsho/toggleterm.nvim'

Plug 'editorconfig/editorconfig-vim'

Plug 'liuchengxu/graphviz.vim'

"Plug 'mfussenegger/nvim-dap'

"Plug 'rcarriga/nvim-dap-ui'

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
require("toggleterm").setup()
END

" COC.nvim

set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
