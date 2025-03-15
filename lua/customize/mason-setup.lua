local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason").setup()
require("mason-nvim-dap").setup({
    ensure_installed = { "python", "delve", "php" },
    automatic_installation = true,
    handlers = {
        function(config)
            -- all sources will get passed here
            require("mason-nvim-dap").default_setup(config)
        end
    }
})
require("mason-lspconfig").setup({
    ensure_installed = {
        "pylsp", "html", "gopls", "jsonls",
        "yamlls", "omnisharp", "ts_ls", "marksman",
        "cssls", "lua_ls", "phpactor", "powershell_es", "sqls"
    },
    automatic_installation = true,
    handlers = {
        function(server_name)
            if lspconfig[server_name] then
                lspconfig[server_name].setup({
                    on_attach = function(client, bufnr)
                        print("LSP started for " .. server_name)
                    end,
                    capabilities = capabilities
                })
            end
        end,
        ['lua_ls'] = function()
            lspconfig['lua_ls'].setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                            disable = { 'missing-fields' }
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
        end,
    }
})
