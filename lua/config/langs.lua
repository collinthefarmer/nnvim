return {
	{
		lang = "typescript",
		filetypes = { "ts", "tsx" },
		lsp = "ts_ls",
		formatters = { "prettierd" },
		completions = {
			appearance = {
				opts = {
					extra_info_hl = "@comment",
				},
			},
		},
	},
	{
		lang = "lua",
		filetypes = { "lua" },
		lsp = "lua_ls",
		formatters = { "stylua" },
		completions = {
			appearance = {
				opts = {
					arguments_hl = "@comment",
				},
			},
		},
	},
}
