require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        lua = { "stylua" },
        nginx = { "nginxfmt" },
        javascript = { "prettier" },
        python = { "black" },
    },
    formatters = {
        nginxfmt = {
            extra_args = { "-i", "4", "--max-empty-lines", "1" },
        },
        stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        },
    },
})

vim.api.nvim_create_user_command("FormatWorkspace", function()
    local conform = require("conform")
    local files = vim.fn.split(vim.fn.system("git ls-files || fd --type f || find . -type f"), "\n")

    print("Formatting workspace files...")

    for _, file in ipairs(files) do
        if not file:match("node_modules/") and not file:match("%.git/") then
            local bufnr = vim.fn.bufadd(file)
            vim.fn.bufload(bufnr)

            conform.format({
                bufnr = bufnr,
                async = false,
                timeout_ms = 2000,
            })

            if vim.bo[bufnr].modified then
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent update")
                end)
            end
        end
    end

    print("Workspace formatting complete!")
end, {})
