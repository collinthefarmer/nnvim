vim.keymap.set("n", "<leader>q", function()
	require("pretty_hover").hover({ toggle = true })
end, {
	desc = "LSP Hover",
})

return {
	"Fildo7525/pretty_hover",
	event = "LspAttach",
	opts = {},
}
