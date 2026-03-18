vim.pack.add {
    { src = "https://github.com/saghen/blink.cmp" },
}

-- borders for hover
vim.o.winborder = 'rounded'

require('blink.cmp').setup({
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },
    signature = {
        enabled = true,
    },
    fuzzy = {
        implementation = 'rust',
    },
    completion = {
        ghost_text = {
            enabled = true,
        },
        list = {
            selection = { auto_insert = false }
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 100,
        },
    },
})
