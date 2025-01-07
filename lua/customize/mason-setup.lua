local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pylsp", "html", "gopls", "jsonls",
        "yamlls", "omnisharp", "ts_ls", "markdown_oxide",
        "cssls", "lua_ls", "phpactor", "powershell_es"
    },
    automatic_installation = true,
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = function(client, bufnr)
                    print("LSP started for " .. server_name)
                end,
                capabilities = vim.lsp.protocol.make_client_capabilities(),
            })
        end,
        ['lua_ls'] = function()
            lspconfig['lua_ls'].setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        runtime = {
                            version = "LuaJIT"
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },

                    },

                }
            })
        end,
        ['pylsp'] = function()
            lspconfig['pylsp'].setup({
                settings = {
                    pylsp = {
                        plugins = {
                            black = { enabled = true },
                            pycodestyle = {
                                enabled = true,
                                ignore = { 'W391', 'E501' },
                                maxLineLength = 100
                            },
                        }
                    }
                }
            })
        end
    }
})
