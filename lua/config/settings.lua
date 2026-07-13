-- Basic Option Alias
local o = vim.opt

vim.cmd.colorscheme("gruber-dark")

-- Clipboard & Backups
o.clipboard = 'unnamedplus'
o.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('data') .. '/undo'
o.undofile = true
o.linebreak = true

-- Modern Shell fallback check
if vim.fn.exepath("zsh") ~= "" then
    o.shell = vim.fn.exepath("zsh")
else
    print("Zsh is not found")
end

-- Line Numbers
o.number = true
o.relativenumber = true

-- Indentation
o.autoindent = true
o.smartindent = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true

-- Search
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

-- Display
o.wrap = true
o.mouse = 'a'
o.cursorline = true
o.fillchars:append({ eob = " " })

local lsp_fmt_group =
    vim.api.nvim_create_augroup("LspAutoFormat", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    callback = function(args)
        local clients = vim.lsp.get_clients({
            bufnr = args.buf,
            method = "textDocument/formatting",
        })

        if #clients == 0 then
            return
        end

        vim.lsp.buf.format({
            bufnr = args.buf,
            async = false,
            timeout_ms = 3000,
        })
    end,
})
