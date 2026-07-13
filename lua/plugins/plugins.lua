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
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = "default" },
            appearance = {
                nerd_font_variant = "mono"
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        opts = {},
    },
    -- Mason, Lsp
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {}
            },
            {
                "mason-org/mason-lspconfig.nvim",
                opts = {},
            },
        }
    },
    -- Telescope, Oil
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "stevearc/oil.nvim",
        ---@module "oil"
        ---@type oil.SetupOpts
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
    },
}
