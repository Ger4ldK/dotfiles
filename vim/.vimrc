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
syntax on

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

" Cursor
" changes cursor to thin line on insert 
let &t_SI = "\e[5 q"
" changes cursor to blinking block on insert end
let &t_EI = "\e[1 q"
" replace gets underscore
let &t_SR = "\<Esc>[3 q"
