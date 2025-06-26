return {
    "mason-org/mason-lspconfig.nvim",
    version = "^2.0.0",
    dependencies = {
        "mason-org/mason.nvim",
        version = "^2.0.0",
    },
    opts = {
        ensure_installed = Map(
            Filter(require("config.langs"), function(l)
                return l.lsp
            end),
            function(l)
                return l.lsp
            end
        ),
        automatic_enable = {
            exclude = Map(
                Filter(require("config.langs"), function(l)
                    return l.lsp_skip_enable
                end),
                function(l)
                    return l.lsp
                end
            ),
        },
    },
}
