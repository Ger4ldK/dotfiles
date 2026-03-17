-- Base NeoVim config with no plugins
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse="a"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = true
vim.o.breakindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.preserveindent = true
vim.o.scrolloff = 25
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.misc/undodir")
vim.o.autocomplete = true
vim.o.autoread = true
vim.o.timeout = false

vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Keybinds
vim.g.mapleader = " "

-- Clear Search Highlights
vim.keymap.set("n", "i", ":nohls<cr>i", { noremap = true, silent = true, desc = "Insert before cursor" })
vim.keymap.set("n", "I", ":nohls<cr>I", { noremap = true, silent = true, desc = "Insert at start of line" })
vim.keymap.set("n", "a", ":nohls<cr>a", { noremap = true, silent = true, desc = "Insert after cursor" })
vim.keymap.set("n", "A", ":nohls<cr>A", { noremap = true, silent = true, desc = "Insert at end of line" })
vim.keymap.set("n", "o", ":nohls<cr>o", { noremap = true, silent = true, desc = "Insert new line under cursor" })
vim.keymap.set("n", "O", ":nohls<cr>O", { noremap = true, silent = true, desc = "Insert new line above cursor" })
-- Save
vim.keymap.set("n", "<leader>w",  ":w<cr>", { noremap = true, silent = true, desc = "Save" })
-- Quit
vim.keymap.set("n", "<leader>q", ":q<cr>", { noremap = true, silent = true, desc = "Quit" })
-- New tab
vim.keymap.set("n", "<leader>n",  ":tabnew<cr>", { noremap = true, silent = true, desc = "New Tab" })
-- Back to FE
vim.keymap.set("n", "<leader>cd", ":Ex<cr>", { noremap = true, silent = true, desc = "Return to netrw" })
