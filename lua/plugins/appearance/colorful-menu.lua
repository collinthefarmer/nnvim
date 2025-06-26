return {
    "xzbdmw/colorful-menu.nvim",
    opts = {
        ls = Reduce(
            Filter(require("config.langs"), function(l)
                return l.lsp
            end),
            function(acc, cur)
                acc[cur.lsp] = ((cur.completions or {}).appearance or {}).opts
                return acc
            end,
            {}
        ),
    },
}
