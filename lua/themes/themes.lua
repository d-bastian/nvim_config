return {
    { "projekt0n/github-nvim-theme", name = "github-theme" },
    "tanvirtin/monokai.nvim",
    "ellisonleao/gruvbox.nvim",
    "p00f/alabaster.nvim",
    "Mofiqul/dracula.nvim",
    "olimorris/onedarkpro.nvim",
    {
        "d-bastian/gruber-dark.nvim",
        name = "gruber-dark",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruber-dark").setup({
                transparent = false,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { bold = true },
                },
            })

            vim.cmd.colorscheme("gruber-dark")
        end,
    }

}
