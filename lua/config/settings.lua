-- Basic Option Alias
local o = vim.opt

-- Theme & Transparency Configuration (Using the theme's native API)
require("gruber-dark").setup({
    transparent = true,
    terminal_colors = true,
})
vim.cmd.colorscheme("gruber-dark")

-- Netrw Disabling (Best practice)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- Native LSP Auto-format on Save (0.11 / 0.12 Native Lua API)
local lsp_fmt_group = vim.api.nvim_create_augroup("LspAutoFormat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    pattern = "*",
    callback = function(args)
        vim.lsp.buf.format({
            bufnr = args.buf,
            async = false, -- Keeps save operations synchronous
        })
    end,
})
