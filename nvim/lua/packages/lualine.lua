vim.pack.add {
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
}

require('lualine').setup({
    always_show_tabline = false,
    options = {
        component_separators = '│',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'filename',
                path = 1,
                symbols = {
                    modified = '',
                    readonly = '',
                    unnamed = ' No Name',
                    newfile = ' New File',
                },
            },
            {
                'filetype',
                icon_only = true,
            },
        },
        lualine_c = {
            {
                'tabs',
                mode = 1,
                symbols = {
                    modified = ''
                },
            },
        },
        lualine_x = {'searchcount', 'diagnostics'},
        lualine_y = {'encoding'},
        lualine_z = {'location'}
  },
})

-- disable native tabline
vim.o.showtabline = 0

-- disable native statusline components
vim.o.showmode = false
vim.o.shortmess = "ltToOCFcsS"
vim.o.showcmd = false
