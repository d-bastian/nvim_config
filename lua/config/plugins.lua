return {
    -- Main Plugins
    "nvim-lua/plenary.nvim", -- Required for some plugins
    "tpope/vim-fugitive",    -- Git commands in nvim
    "nvim-lualine/lualine.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup {
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
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "sindrets/diffview.nvim",
    "windwp/nvim-autopairs",
    "nvim-tree/nvim-web-devicons",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
    },
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    -- CMP
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
}
