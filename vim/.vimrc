" by default vim won't see this, create a .vimrc in HOME dir and source the path to this instead

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
set scrolloff=25
syntax on

" Cursor
" changes cursor to thin line on insert 
let &t_SI = "\e[5 q"
" changes cursor to blinking block on insert end
let &t_EI = "\e[1 q"
" replace gets underscore
let &t_SR = "\<Esc>[3 q"

