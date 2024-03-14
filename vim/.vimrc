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
