return {
    -- Main Plugins
    "nvim-lua/plenary.nvim", -- Required for some plugins
    "tpope/vim-fugitive",    -- Git commands in nvim
    "nvim-lualine/lualine.nvim",
    "numToStr/Comment.nvim",
    "sindrets/diffview.nvim",
    "nvim-tree/nvim-web-devicons",
    "HiPhish/rainbow-delimiters.nvim",

    -- Completion
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },

    -- Mason, Lsp
    "neovim/nvim-lspconfig",
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",

    -- Telescope, Oil
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
    },
    {
        "stevearc/oil.nvim",
        ---@module "oil"
        ---@type oil.SetupOpts
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
    },

    --Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "c",
                    "lua",
                    "go",
                    "python",
                    "html",
                    "json",
                    "css",
                    "typescript",
                    "javascript",
                    "markdown",
                    "markdown_inline",
                    "c_sharp",
                    "yaml",
                    "php"
                },
                ignore_install = {},
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    use_languagetree = true
                }
            }
        end
    },
}
