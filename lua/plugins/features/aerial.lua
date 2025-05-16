vim.keymap.set("n", "<leader>A", "<Cmd>AerialToggle<CR>")

return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
		manage_folds = true,
		close_on_select = false,

		layout = {
			resize_to_content = false,
			default_direction = "left",
		},
	},
}
