return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "xzbdmw/colorful-menu.nvim",
    },
    version = "1.*",
    opts = {
        keymap = { preset = "default" },
        appearance = {
            nerd_font_variant = "normal",
        },
        completion = {
            documentation = {
                auto_show = true,
                window = { border = "single" },
                draw = function(opts)
                    if opts.item and opts.item.documentation then
                        local out = require("pretty_hover.parser").parse(
                            opts.item.documentation.value
                        )
                        opts.item.documentation.value = out:string()
                    end

                    opts.default_implementation(opts)
                end,
            },
            menu = {
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                    },
                    components = {
                        label = {
                            width = { fill = true, max = 80 },
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(
                                    ctx
                                )
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(
                                    ctx
                                )
                            end,
                        },
                        kind_icon = {
                            text = function(ctx)
                                local icon = ctx.kind_icon
                                if
                                    vim.tbl_contains(
                                        { "Path" },
                                        ctx.source_name
                                    )
                                then
                                    local dev_icon, _ =
                                        require("nvim-web-devicons").get_icon(
                                            ctx.label
                                        )
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon =
                                        require("lspkind").symbolic(ctx.kind, {
                                            mode = "symbol",
                                        })
                                end

                                return icon .. ctx.icon_gap
                            end,

                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if
                                    vim.tbl_contains(
                                        { "Path" },
                                        ctx.source_name
                                    )
                                then
                                    local dev_icon, dev_hl =
                                        require("nvim-web-devicons").get_icon(
                                            ctx.label
                                        )
                                    if dev_icon then
                                        hl = dev_hl
                                    end
                                end
                                return hl
                            end,
                        },
                    },
                },
            },
            ghost_text = { enabled = true },
        },
        signature = { enabled = true },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
