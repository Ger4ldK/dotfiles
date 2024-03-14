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
Plug 'wellle/context.vim'
" GitGutter
Plug 'airblade/vim-gitgutter'
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

" AutoPairs
lua << EOF
require("nvim-autopairs").setup {}
EOF
