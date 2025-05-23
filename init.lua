require("utils")
require("alacritty")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        { import = "plugins.langs" },
        { import = "plugins.appearance" },
        { import = "plugins.features" },
    },
})

local capabilities = require("blink.cmp").get_lsp_capabilities()
for _, lang in pairs(require("config.langs")) do
    vim.lsp.config(lang.lang, capabilities)
end

require("config.vimopts")
require("config.colors")
require("config.keys")

vim.opt.laststatus = 0
