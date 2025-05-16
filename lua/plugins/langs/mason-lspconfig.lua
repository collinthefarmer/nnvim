return {
	"mason-org/mason-lspconfig.nvim",
	version = "^2.0.0",
	dependencies = {
		"mason-org/mason.nvim",
		version = "^2.0.0",
	},
	opts = {
		ensure_installed = Map(require("config.langs"), function(l)
			return l.lsp
		end),
	},
}
