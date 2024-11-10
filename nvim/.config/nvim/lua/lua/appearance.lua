-- Theme, Statusline, etc.
vim.cmd([[
    " Theme
    if has('termguicolors')      
        set termguicolors
    endif

    let g:sonokai_style = 'andromeda'
    let g:sonokai_better_performance = 1
    colorscheme sonokai

    " Statusline
    let g:airline_theme='murmur'
    let g:airline_powerline_fonts = 1
]])

require('bufferline').setup()
