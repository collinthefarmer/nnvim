vim.keymap.set(
    "n",
    "<leader>D",
    "<Cmd>Trouble diagnostics toggle filter.buf=0 filter.severity = vim.diagnostic.severity.ERROR<CR>"
)
vim.keymap.set("n", "<leader>R", "<Cmd>Trouble lsp toggle<CR>")

return {
    "folke/trouble.nvim",
    opts = {
        focus = true,
        win = {
            type = "split",
            position = "bottom",
        },
    },
}
