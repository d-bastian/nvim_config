-- Basic
vim.g.mapleader = ','
vim.cmd 'filetype indent on'
vim.cmd 'syntax enable'
vim.opt.clipboard = 'unnamedplus'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'
vim.opt.undofile = true
vim.o.shell = "pwsh"

-- Folds
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Encoding
vim.opt.encoding = 'utf-8'

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Display
vim.opt.wrap = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.fillchars:append({
    eob = " ", -- Replace tildes with blank space
})

-- Theme
vim.cmd.colorscheme("gruber-darker")

-- Auto format on save
vim.cmd([[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.format({async = false})
    augroup END
]])
