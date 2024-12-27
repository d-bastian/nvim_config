require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pylsp", "html", "gopls", "jsonls",
        "yamlls", "omnisharp", "ts_ls", "markdown_oxide",
        "cssls", "lua_ls", "phpactor"
    },
    automatic_installation = true,
})

require("lspconfig").pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                black = { enabled = true },
                pycodestyle = { enabled = false },
                pylint = { enabled = true },
                pyflakes = { enabled = false },
                yapf = { enabled = true },
            },
        },
    },
}
require("lspconfig").html.setup {}
require("lspconfig").gopls.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").yamlls.setup {}
require("lspconfig").omnisharp.setup {}
require("lspconfig").ts_ls.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").phpactor.setup {}
require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT", -- Set Lua version
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" }, -- Add globals like "vim" to avoid diagnostic warnings
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Add Neovim runtime files to LuaLS workspace
            },
            telemetry = {
                enable = false, -- Disable telemetry
            },
        },
    },
}
require("lspconfig").markdown_oxide.setup {}
