return {
    -- Main Plugins
    "nvim-lua/plenary.nvim", -- Required for some plugins
    "tpope/vim-fugitive",    -- Git commands in nvim
    "nvim-lualine/lualine.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "sindrets/diffview.nvim",
    "windwp/nvim-autopairs",
    "github/copilot.vim",
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
