-- Base NeoVim config with no plugins
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
vim.opt.scrolloff = 25

vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Keybinds
-- leader mappings are done in lazy.lua as well
vim.g.mapleader = " "

-- Clear Search Highlights
vim.keymap.set("n", "i", ":nohls<cr>i", { noremap = true, silent = true, desc = "Insert before cursor" })
vim.keymap.set("n", "I", ":nohls<cr>I", { noremap = true, silent = true, desc = "Insert at start of line" })
vim.keymap.set("n", "a", ":nohls<cr>a", { noremap = true, silent = true, desc = "Insert after cursor" })
vim.keymap.set("n", "A", ":nohls<cr>A", { noremap = true, silent = true, desc = "Insert at end of line" })
vim.keymap.set("n", "o", ":nohls<cr>o", { noremap = true, silent = true, desc = "Insert new line under cursor" })
vim.keymap.set("n", "O", ":nohls<cr>O", { noremap = true, silent = true, desc = "Insert new line above cursor" })
-- Save
vim.keymap.set("n", "<leader>W",  ":w<cr>", { noremap = true, silent = true, desc = "Save" })
-- Quit without Saving
vim.keymap.set("n", "<leader>Z", ":q!<cr>", { noremap = true, silent = true, desc = "Close without Saving" })
-- New tab
vim.keymap.set("n", "<leader>n",  ":tabnew<cr>", { noremap = true, silent = true, desc = "New Tab" })
-- Back to FE
vim.keymap.set("n", "<leader>cd", ":Ex<cr>", { noremap = true, silent = true, desc = "Return to netrw" })
