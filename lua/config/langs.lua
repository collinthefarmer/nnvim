return {
    {
        lang = "go",
        filetypes = { "go" },
        lsp = "gopls",
        formatters = { "gofmt" },
    },
    {
        lang = "typescript",
        filetypes = { "js", "ts", "tsx", "json" },
        formatters = { "prettierd" },
        lsp = "ts_ls",
        lsp_skip_config = true,
        lsp_skip_enable = true,
    },
    {
        lang = "lua",
        filetypes = { "lua" },
        lsp = "lua_ls",
        formatters = { "stylua" },
    },
    {
        lang = "c_sharp",
        filetypes = { "cs" },
        formatters = {
            "csharpier",
            command = "dotnet",
            args = { "csharpier", "format", "--write-stdout", "$FILENAME" },
            stdin = true,
        },
    },
    {
        lang = "html",
        filetypes = { "html", "xaml" },
        lsp = "html",
        formatters = { "prettierd" },
    },
}
