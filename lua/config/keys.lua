vim.keymap.set("n", "<leader>r", function()
    vim.lsp.buf.rename()
end, {
    desc = "Rename",
})

vim.keymap.set("n", "<leader>d", function()
    vim.lsp.buf.definition()
end, {
    desc = "Goto declaration",
})

vim.keymap.set("n", "<leader>T", function()
    vim.diagnostic.goto_prev()
end, {
    desc = "Previous Diagnostic",
})

vim.keymap.set("n", "<leader>t", function()
    vim.diagnostic.goto_next()
end, {
    desc = "Next Diagnostic",
})
