return {
    -- Main Plugins
    "nvim-lualine/lualine.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "windwp/nvim-autopairs",
    "github/copilot.vim",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
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
