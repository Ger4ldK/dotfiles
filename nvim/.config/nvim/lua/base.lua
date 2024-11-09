-- Base Vim config with no plugins
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse="a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.preserveindent = true
vim.opt.cursorline = true
vim.opt.scrolloff = 25

-- Keybinds
-- Clear Search Highlights
vim.api.nvim_set_keymap("n", "i", ":nohls<cr>i", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "I", ":nohls<cr>I", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "a", ":nohls<cr>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "A", ":nohls<cr>A", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "o", ":nohls<cr>o", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "O", ":nohls<cr>O", { noremap = true, silent = true })
-- Save
vim.api.nvim_set_keymap("n", "<space>W",  ":w<cr>", { noremap = true, silent = true })
-- Quit without Saving
vim.api.nvim_set_keymap("n", "<space>Z", ":q!<cr>", { noremap = true, silent = true })
-- New tab
vim.api.nvim_set_keymap("n", "<space>n",  ":tabnew<cr>", { noremap = true, silent = true })
