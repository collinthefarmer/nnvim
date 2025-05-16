vim.keymap.set("v", "<leader>fs", "<cmd>Telescope grep_string<cr>", {
	desc = "Find Selection",
})
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {
	desc = "Find File",
})
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", {
	desc = "Registers",
})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers only_cwd=true ignore_current_buffer=true sort_mru=true<cr>", {
	desc = "Buffers",
})
vim.keymap.set("n", "<leader>fF", "<cmd>Telescope live_grep<cr>", {
	desc = "grep",
})
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {
	desc = "Current Buffer",
})

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
