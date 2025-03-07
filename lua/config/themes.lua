return {
    "rebelot/kanagawa.nvim",
    "navarasu/onedark.nvim",
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    "nyoom-engineering/oxocarbon.nvim",
    "oonamo/ef-themes.nvim",
    { "kepano/flexoki-neovim",     name = "flexoki" },
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
    },
    {
        "Verf/deepwhite.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "deparr/tairiki.nvim",
        lazy = false,
        priority = 1000, -- only necessary if you use tairiki as default theme
        config = function()
            require("tairiki").setup {
                style = "dark",
            }
        end,
    },
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('bamboo').setup {
                -- optional configuration here
            }
            require('bamboo').load()
        end,
    },
}
