vim.cmd"packadd nvim.undotree"

vim.keymap.set('n', "<leader>U", ":Undotree<cr>", { noremap = true, silent = true, desc = "Undo tree" })
