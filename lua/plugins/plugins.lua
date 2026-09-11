return {
    -- Main Plugins
    "tpope/vim-fugitive", -- Git commands in nvim
    "sindrets/diffview.nvim",
    "HiPhish/rainbow-delimiters.nvim",
    "lewis6991/gitsigns.nvim",

    -- Mini.nvim plugins

    { "nvim-mini/mini.pairs",      version = "*", },
    { "nvim-mini/mini.comment",    version = "*" },
    { "nvim-mini/mini.surround",   version = "*" },
    { 'nvim-mini/mini.statusline', version = '*' },

    -- Formatting
    {
        'stevearc/conform.nvim',
        opts = {},
    },

    -- Completion
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "mikavilpas/blink-ripgrep.nvim",
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
                    "ripgrep",
                },
                providers = {
                    ripgrep = {
                        module = "blink-ripgrep",
                        name = "Ripgrep",
                        ---@module "blink-ripgrep"
                        ---@type blink-ripgrep.Options
                        opts = {},
                    },
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

    -- Mason / LSP
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,

        opts = {
            ensure_installed = {
                "gopls",
                "lua_ls",
                "pylsp",
                "yamlls",
                "jsonls",
                "ts_ls",
                "docker_compose_language_service",
                "roslyn_ls"
            },
        },

        dependencies = {
            {
                "mason-org/mason.nvim",
                lazy = false,
                opts = {},
            },

            {
                "neovim/nvim-lspconfig",
                lazy = false,
            },
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
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
    }
}
