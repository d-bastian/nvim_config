return {
    -- Main Plugins
    "tpope/vim-fugitive", -- Git commands in nvim
    "nvim-lualine/lualine.nvim",
    "numToStr/Comment.nvim",
    "sindrets/diffview.nvim",
    "HiPhish/rainbow-delimiters.nvim",

    -- Completion
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "1.*",

        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "default",

                ["<C-e>"] = {
                    function(cmp)
                        cmp.show({
                            providers = { "snippets" },
                        })
                    end,
                },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = {
                    auto_show = false,
                },
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },

            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },
        },

        opts_extend = {
            "sources.default",
        },
    },

    -- Auto pairs
    {
        "echasnovski/mini.pairs",
        version = false,
        opts = {},
    },

    -- Mason / LSP
    {
        "mason-org/mason-lspconfig.nvim",

        opts = {
            ensure_installed = {
                "gopls",
                "lua_ls",
                "pylsp",
                "jsonls",
                "ts_ls",
                "csharp_ls",
                "docker_compose_language_service",
                "ast_grep",
            },
        },

        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {},
            },

            "neovim/nvim-lspconfig",
        },
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.2.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- File browser
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
        lazy = false,
    },
}
