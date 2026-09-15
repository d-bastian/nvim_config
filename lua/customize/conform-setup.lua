require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        lua = { "stylua" },
        nginx = { "nginxfmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        python = { "black" },
        markdown = { "prettier" },
        go = { "gofmt" },
    },
    formatters = {
        nginxfmt = {
            append_args = { "-i", "4", "--max-empty-lines", "1" },
        },
        stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        },
    },
})
