local capabilities = require("blink.cmp").get_lsp_capabilities()

local golang = {
    lang = "go",
    filetypes = { "go" },
    lsp = "gopls",
    formatters = { "gofmt" },
}

local typescript_vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vim.fn.stdpath("data")
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
    languages = { "vue" },
    configNamespace = "typescript",
    enableForWorkspaceTypeScriptVersions = true,
}

local typescript = {
    lang = "typescript",
    filetypes = {
        "json",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
    },
    formatters = { "prettierd" },
    lsp = "vtsls",
    lsp_config = {
        capabilities = capabilities,
        init_options = {
            autoUseWorkspaceTsdk = true,
            plugins = {
                typescript_vue_plugin,
            },
        },
        settings = {
            vtsls = {
                tsserver = {
                    globalPlugins = {
                        typescript_vue_plugin,
                    },
                },
            },
        },
    },
}

local vue = {
    lang = "vue",
    lsp = "vue_ls",
    filetypes = {
        "json",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
    },
    lsp_config = {
        cmd = { "vue-language-server", "--stdio" },
        on_init = function(client)
            client.handlers["tsserver/request"] = function(_, result, context)
                local clients = vim.lsp.get_clients({
                    bufnr = context.bufnr,
                    name = "vtsls",
                })
                if #clients == 0 then
                    vim.notify(
                        "Could not found `vtsls` lsp client, vue_lsp would not work without it.",
                        vim.log.levels.ERROR
                    )
                    return
                end
                local ts_client = clients[1]

                local param = unpack(result)
                local id, command, payload = unpack(param)
                ts_client:exec_cmd({
                    command = "typescript.tsserverRequest",
                    arguments = {
                        command,
                        payload,
                    },
                }, { bufnr = context.bufnr }, function(_, r)
                    local body
                    if r == nil then
                        body = r
                    else
                        body = r.body
                    end
                    local response_data = { { id, body } }
                    ---@diagnostic disable-next-line: param-type-mismatch
                    client:notify("tsserver/response", response_data)
                end)
            end
        end,
    },
}

local lua = {
    lang = "lua",
    filetypes = { "lua" },
    lsp = "lua_ls",
    lsp_config = {
        capabilities = capabilities,
    },
    formatters = { "stylua" },
}

local csharp = {
    lang = "c_sharp",
    filetypes = { "cs" },
    formatters = { "csharpier" },
    lsp_config = {
        capabilities = capabilities,
    },
}

local html = {
    lang = "html",
    filetypes = { "html", "xaml" },
    lsp = "html",
    lsp_config = {
        capabilities = capabilities,
    },
    formatters = { "prettierd" },
}

local langs = {
    csharp,
    golang,
    html,
    lua,
    typescript,
    vue,
}

local lsp_langs = Filter(langs, function(l)
    return l.lsp
end)

local formatter_langs = Filter(langs, function(l)
    return l.formatters
end)

--

local function setup()
    for _, lang in pairs(lsp_langs) do
        if lang.lsp_config and not lang.lsp_skip_config then
            vim.lsp.config(
                lang.lsp,
                vim.tbl_extend(
                    "force",
                    lang.lsp_config,
                    { filetypes = lang.filetypes }
                )
            )
        end

        if not lang.lsp_skip_enable then
            vim.lsp.enable(lang.lsp)
        end
    end
end

return {
    setup = setup,
    lsp_langs = lsp_langs,
    formatter_langs = formatter_langs,
}
