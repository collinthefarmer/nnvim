return {
    "xzbdmw/colorful-menu.nvim",
    opts = {
        ls = Reduce(require("config.langs").lsp_langs, function(acc, cur)
            acc[cur.lsp] = ((cur.completions or {}).appearance or {}).opts
            return acc
        end, {}),
    },
}
