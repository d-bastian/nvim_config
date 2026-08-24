require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "gopls", "lua_ls", "pylsp", "jsonls", "ts_ls" },
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

vim.lsp.config('gopls', {
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
})

vim.lsp.config('ast_grep', {})

vim.lsp.config("jsonls", {
    settings = {
        json = {
            validate = { enable = true },
            format = { enable = true },
        },
    },
})
