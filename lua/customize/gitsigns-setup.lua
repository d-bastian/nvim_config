require("gitsigns").setup {
    on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Keybinds
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        map('n', '<leader>hd', gitsigns.diffthis)
    end

}
