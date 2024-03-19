" TODO Port to .lua format
" NVIM v0.9.5
" Ideally run on a terminal emulator with a PowerLine Nerd Font
" Requires vim-plug and :PlugInstall to be run
" Plugins
" vim-plug setup
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Theme
Plug 'sainnhe/gruvbox-material'
" AutoPairs
Plug 'windwp/nvim-autopairs'
" Telescope (REQUIRES RIPGREP)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
" NerdCommenter
Plug 'preservim/nerdcommenter'
" Airline Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Context
" TODO update to treesitter context as it has more options
Plug 'wellle/context.vim'
" GitGutter
Plug 'airblade/vim-gitgutter'
" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Signatures
Plug 'ray-x/lsp_signature.nvim'
" Mason (LSP Manager)
Plug 'williamboman/mason.nvim'
" LSP Configs for Mason
Plug 'williamboman/mason-lspconfig.nvim'
" Wildmenu customization
function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
endfunction
Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
" Minimap (REQUIRES code-minimap)
Plug 'wfxr/minimap.vim'
call plug#end()

" Base Vim config
set number
set mouse=a
set ignorecase
set smartcase
set wrap
set breakindent
set tabstop=4
set shiftwidth=4
set expandtab
set preserveindent
set relativenumber
set cursorline
set scrolloff=25

" Keybinds
" Clear Search Highlights
nnoremap i :nohls<cr>i
nnoremap I :nohls<cr>I
nnoremap a :nohls<cr>a
nnoremap A :nohls<cr>A
nnoremap o :nohls<cr>o
nnoremap O :nohls<cr>O
" Save
nnoremap <space>W :w<cr>
" Quit without Saving
nnoremap <space>Z :q!<cr>
" Fold
nnoremap <space>f zfa
" Unfold
nnoremap <space>F zo<cr>
" New tab
nnoremap <space>n :tabnew<cr>
" Telescope Live Grep
" REQUIRES ripgrep https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation
nnoremap <CS-F> :Telescope live_grep<cr>
" Telescope File Finder
nnoremap <C-p> :Telescope find_files<cr>
" Telescope Buffers
nnoremap <CS-R> :Telescope buffers<cr>
" NERDCommenter Comment Toggle
nnoremap <C-c> :call nerdcommenter#Comment(0, "toggle")<cr>

" Theme
set termguicolors
set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" Statusline
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

" Commenter
" Create default mappings
let g:NERDCreateDefaultMappings = 0
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1 
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Context
let g:context_enabled = 1

" GitGutter - track git changes by line
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_async = 0

" Minimap
let g:minimap_auto_start = 1
let g:minimap_git_colors = 1

" Wildmenu customization
" Default keys
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#fa8d34'}]),
      \ },
      \ 'border': 'rounded',
      \ 'max_height': '75%',
      \ 'max_width': '75%',
      \ 'min_height': '75%',
      \ 'min_width': '75%',
      \ 'prompt_position': 'top',
      \ 'reverse': 0,
      \ })))
lua << EOF
-- AutoPairs
require("nvim-autopairs").setup {}

-- Mason LSP Management
require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = {
        "tsserver",
        "jsonls",
        "bashls",
        -- "gopls",
    },
    automatic_installation = true,
}


-- Autocomplete
local cmp = require'cmp'

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
}, {
  { name = 'buffer' },
})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Copy for each lsp server enabled.
-- require('lspconfig')[''].setup {
--    capabilities = capabilities
-- }
require('lspconfig')['tsserver'].setup {
   capabilities = capabilities
}
require('lspconfig')['jsonls'].setup {
   capabilities = capabilities
}
require('lspconfig')['bashls'].setup {
   capabilities = capabilities
}

-- Signatures from LSP
local cfg = {
    hint_enable = false,
    handler_opts = {
      border = 'single'
    },
}
require "lsp_signature".setup(cfg)
EOF
