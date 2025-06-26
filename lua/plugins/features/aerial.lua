vim.keymap.set("n", "<leader>A", "<Cmd>AerialToggle<CR>")

return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

        layout = {
            default_direction = "float",

            max_width = { 120, 0.4 },
            width = 120,
        },

        show_guides = true,

        float = {
            border = "rounded",
            max_height = { 8, 0.2 },
            height = 8,
        },
    },
}
