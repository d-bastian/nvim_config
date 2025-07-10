require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "pylsp", "omnisharp", "marksman",
        "lua_ls", "powershell_es", "sqls"
    },
    automatic_installation = true,
    automatic_enable = true
})

-- Custom configurations
vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 120
                }
            }
        }
    }
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
                disable = { "missing-fields" },
            },
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },

})
