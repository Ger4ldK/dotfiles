languages = {
    'lua',
    'go',
    'rust',
    'c',
    'vim',
    'vimdoc',
    'kdl',
    'toml',
    'json',
    'markdown',
}

vim.pack.add {
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
}

require('nvim-treesitter').setup()
require('nvim-treesitter').install(languages)

require('treesitter-context').setup({
    enable = true,
    mode = cursor,
})

-- 'za' to toggle fold at cursor
vim.opt.foldlevel = 3 -- n levels in before folding
vim.api.nvim_create_autocmd('FileType', {
    pattern = languages,
    callback = function()
      -- syntax highlighting, provided by Neovim
      vim.treesitter.start()
      -- folds, provided by Neovim
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
      -- indentation, provided by nvim-treesitter
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
