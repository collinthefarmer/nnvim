-- local open = false
-- local win = nil
-- vim.keymap.set("n", "<leader>F", function()
-- 	local oil = require("oil")
--
-- 	if open then
-- 		open = false
-- 		oil.close()
-- 		vim.api.nvim_win_close(win, false)
-- 		win = nil
-- 	else
-- 		-- open a vertical split and then open oil in it
-- 		local oilsplit = vim.api.nvim_open_win(0, true, { win = -1, split = "left", width = 32 })
-- 		oil.open(nil, {}, function()
-- 			open = true
-- 			win = oilsplit
-- 		end)
-- 	end
-- end)

return {
	"stevearc/oil.nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	opts = {},
}
