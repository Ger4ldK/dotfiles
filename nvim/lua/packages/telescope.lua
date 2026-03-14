vim.pack.add {
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
}

local telescope = require('telescope')
telescope.setup{
    pickers = {
        find_files = {
            hidden = true,
        }
    } 
}

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>T", builtin.builtin, { noremap = true, silent = true, desc = "Telescope command" })
vim.keymap.set("n", "<leader>tl", builtin.live_grep, { noremap = true, silent = true, desc = "Live grep" })
vim.keymap.set("n", "<leader>tw", builtin.grep_string, { noremap = true, silent = true, desc = "Grep string under cursor" })
vim.keymap.set("n", "<leader>tb", builtin.buffers, { noremap = true, silent = true, desc = "List open buffers from current session" })
vim.keymap.set("n", "<leader>tf", builtin.find_files, { noremap = true, silent = true, desc = "File search" })
vim.keymap.set("n", "<leader>tp", builtin.oldfiles, { noremap = true, silent = true, desc = "Jump through previously opened files" })
vim.keymap.set("n", "<leader>t/", builtin.search_history, { noremap = true, silent = true, desc = "List search (/) history" })
vim.keymap.set("n", "<leader>tk", builtin.keymaps, { noremap = true, silent = true, desc = "List keymaps" })
