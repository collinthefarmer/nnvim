vim.keymap.set("n", "<leader>GD", "<Cmd>DiffviewOpen<CR>", { noremap = true, silent = true, desc = "Git DiffView" })

return {
	"sindrets/diffview.nvim",
}
