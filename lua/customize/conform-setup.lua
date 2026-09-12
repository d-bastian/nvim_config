require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        nginx = { "nginxfmt" },
        lua = { "stylua" },
        javascript = { "prettier" },
        python = { "black" }
    },
})
