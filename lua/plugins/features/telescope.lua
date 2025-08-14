local tel = require("telescope.builtin")
local themes = require("telescope.themes")

local function cmd_telescope_search_refs()
    local opts = {
        include_declaration = false,
        jump_type = "tab",
        show_line = false,
        reuse_win = true,
    }

    tel.lsp_references(themes.get_ivy(opts))
end

local function cmd_telescope_search_definition()
    local opts = {
        jump_type = "tab",
        show_line = false,
        reuse_win = true,
    }

    tel.lsp_definitions(opts)
end

local function cmd_telescope_search_symbols()
    tel.lsp_dynamic_workspace_symbols({})
end

local function cmd_telescope_search_symbols_local()
    tel.lsp_document_symbols({})
end

local function cmd_telescope_search_diagnostics()
    tel.diagnostics({ disable_coordinates = true, sort_by = "severity" })
end

local function cmd_telescope_search_diagnostics_local()
    tel.diagnostics({
        bufnr = 0,
        disable_coordinates = true,
        sort_by = "severity",
    })
end

local function cmd_telescope_search_oldfiles()
    tel.oldfiles({
        only_cwd = true,
    })
end

local function cmd_telescope_search_live()
    tel.live_grep({ disable_coordinates = true })
end

local function cmd_telescope_search_gitfiles()
    tel.git_files({})
end

local function cmd_telescope_search_git_status()
    tel.git_status({})
end

local function cmd_telescope_search_git_commits()
    tel.git_commits({})
end

local function cmd_telescope_search_git_commits_local()
    tel.git_bcommits({})
end

vim.keymap.set("n", "<leader>R", cmd_telescope_search_refs)
vim.keymap.set("n", "<leader>d", cmd_telescope_search_definition)

vim.keymap.set("n", "<leader>S", cmd_telescope_search_symbols)
vim.keymap.set("n", "<leader>s", cmd_telescope_search_symbols_local)

vim.keymap.set("n", "<leader>E", cmd_telescope_search_diagnostics)
vim.keymap.set("n", "<leader>e", cmd_telescope_search_diagnostics_local)

vim.keymap.set("n", "<leader>G", cmd_telescope_search_live)
vim.keymap.set("n", "<leader>F", cmd_telescope_search_gitfiles)
vim.keymap.set("n", "<leader>f", cmd_telescope_search_oldfiles)

vim.keymap.set("n", "<leader>gs", cmd_telescope_search_git_status)

vim.keymap.set("n", "<leader>gC", cmd_telescope_search_git_commits)
vim.keymap.set("n", "<leader>gc", cmd_telescope_search_git_commits_local)

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    opts = {
        path_display = { "filename_first", "truncate" },
        dynamic_preview_title = true,
        sorting_strategy = "descending",
        preview = {
            filesize_limit = 5,
        },
    },
    config = function(opts)
        require("telescope").setup(opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "TelescopePreviewerLoaded",
            callback = function(args)
                vim.opt_local.number = true
            end,
        })
    end,
}
