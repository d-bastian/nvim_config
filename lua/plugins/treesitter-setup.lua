require("nvim-treesitter").setup({
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
        "php" },
    highlight = {
        enable = true
    }
})
