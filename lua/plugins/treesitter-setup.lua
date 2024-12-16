require 'nvim-treesitter'.setup {
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
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}
