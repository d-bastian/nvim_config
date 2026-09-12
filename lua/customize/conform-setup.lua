require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        lua = { "stylua" },
        nginx = { "nginxfmt" },
        javascript = { "prettier" },
        python = { "black" }
    },
    formatters = {
        nginxfmt = {
            extra_args = { "-i", "4", "--max-empty-lines", "1" },
        },
    }
})
