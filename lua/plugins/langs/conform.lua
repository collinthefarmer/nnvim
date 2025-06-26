vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        if vim.g.disable_autoformat or vim.b[args.buf].disable_autoformat then
            return
        end

        require("conform").format({ bufnr = args.buf })
    end,
})

return {
    "stevearc/conform.nvim",
    opts = function()
        local formatters_by_ft = Reduce(
            Filter(require("config.langs"), function(l)
                return l.formatters
            end),
            function(acc, cur)
                for _, ft in pairs(cur.filetypes) do
                    acc[ft] = cur.formatters
                end
                return acc
            end,
            {}
        )

        return {
            formatters_by_ft = formatters_by_ft,
            formatters = {
                csharpier = {
                    command = "dotnet",
                    args = {
                        "csharpier",
                        "format",
                        "--write-stdout",
                    },
                    stdin = true,
                    inherit = false,
                },
            },
        }
    end,
}
