vim.pack.add {
    { src = "https://github.com/hedyhli/outline.nvim" }
}

require('outline').setup({
    outline_window = {
        width = 25,
        focus_on_open = false,
        auto_width = {
            enabled = true,
            max_width = 50,
        },
    },
    outline_items = {
        show_symbol_details = false,
        show_symbol_lineno = true,
    },
})

vim.keymap.set("n", "<leader>O", ":Outline<cr>", { noremap = true, silent = true, desc = "Show symbol tree" })
