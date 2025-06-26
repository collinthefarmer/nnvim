local cmd_tinyca_open_codeactions = function()
    require("tiny-code-action").code_action()
end

vim.keymap.set(
    "n",
    "<leader>ca",
    cmd_tinyca_open_codeactions,
    { noremap = true, silent = true }
)

return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    event = "LspAttach",
    opts = {
        backend = "vim",
        picker = {
            "telescope",
            opts = require("telescope.themes").get_cursor({
                layout_config = { width = 0.5, preview_width = 0.5 },
            }),
        },
    },
}
