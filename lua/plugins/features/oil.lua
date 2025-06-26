vim.keymap.set("n", "<leader>1", function()
    require("oil").open()
end)

return {
    "stevearc/oil.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = {
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
    },
}
