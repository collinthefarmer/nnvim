vim.keymap.set("n", "<leader>F", function()
    require("oil").open()
end)

return {
    "stevearc/oil.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = {},
}
