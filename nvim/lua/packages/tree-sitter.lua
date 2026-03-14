vim.pack.add {
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
}

require('nvim-treesitter').setup({
    highlight = { enable = true },
    install_dir = vim.fn.stdpath('data') .. '/site',
})
require('nvim-treesitter').install {
    'lua',
    'go',
    'rust',
    'c',
    'vim',
    'vimdoc',
    'kdl',
    'toml',
    'json',
}

require('treesitter-context').setup({
    enable = true,
    mode = cursor,
})

