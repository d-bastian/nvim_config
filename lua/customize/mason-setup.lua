local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local function on_attach(client, bufnr)
    print(string.format("lsp %d -> %s", bufnr, client))
end

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "pylsp", "gopls", "omnisharp", "marksman",
        "lua_ls", "phpactor", "powershell_es", "sqls"
    },
    automatic_installation = true,
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                flags = { debounce_text_changes = 150 },
            })
        end,
        ["lua_ls"] = function()
            lspconfig["lua_ls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
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
        end,
    },
})
