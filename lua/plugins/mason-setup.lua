require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pylsp", "html", "gopls", "jsonls",
        "yamlls", "omnisharp", "ts_ls", "markdown_oxide",
        "cssls", "lua_ls"
    },
    automatic_installation = true,
})

require("lspconfig").pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                black = {
                    enabled = true,
                    line_length = 88, -- Set to your preferred line length
                },
                pycodestyle = {
                    enabled = false, -- Disable pycodestyle to avoid conflicts with Black
                },
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
require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server that you're using LuaJIT (used by Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
require("lspconfig").markdown_oxide.setup {}
