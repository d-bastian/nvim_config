-- Basic
vim.g.mapleader = ','
vim.cmd 'filetype indent on'
local opt = vim.opt

vim.cmd 'syntax enable'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath('data') .. '/undo'
opt.undofile = true
opt.linebreak = true
opt.shell = "pwsh"

-- Theme
vim.cmd.colorscheme("gruber-darker")

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Encoding
opt.encoding = 'utf-8'

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

-- Search
opt.incsearch = true
opt.hlsearch = true

-- Display
opt.wrap = true
opt.mouse = 'a'
opt.termguicolors = true
opt.cursorline = true
opt.fillchars:append({
    eob = " ", -- Replace tildes with blank space
})

-- Auto format on save
vim.cmd([[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.format({async = false})
    augroup END
]])
