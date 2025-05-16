vim.keymap.set("n", "<leader>T", "<Cmd>Trouble lsp toggle<CR>")
vim.keymap.set(
	"n",
	"<leader>D",
	"<Cmd>Trouble diagnostics toggle filter.buf=0 filter.severity = vim.diagnostic.severity.ERROR<CR>"
)
vim.keymap.set("n", "<leader>r", "<Cmd>Trouble float_references toggle<CR>")

return {
	"folke/trouble.nvim",
	opts = {
		focus = true,
		win = {
			type = "split",
			position = "right",
		},
		modes = {
			float_references = {
				mode = "lsp_references",
				win = {
					type = "float",
					relative = "cursor",
					border = "rounded",
					title = "References",
					title_pos = "center",
					position = { 0, -1 },
					size = { width = 0.3, height = 0.3 },
					zindex = 200,
				},
			},
		},
	},
}
