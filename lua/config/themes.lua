return {
    "rebelot/kanagawa.nvim",
    "navarasu/onedark.nvim",
    { "ellisonleao/gruvbox.nvim",  priority = 1000,  config = true, opts = ... },
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false,  priority = 1000 },
    "nyoom-engineering/oxocarbon.nvim",
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({
            })
        end
    },
}
