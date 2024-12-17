-- Vim Settings
vim.g.mapleader = ','
vim.cmd 'filetype plugin on'
vim.cmd 'syntax enable'
vim.opt.clipboard = 'unnamedplus'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8', 'utf-8bom', 'latin1' }

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
vim.opt.fillchars:append({
    eob = " ", -- Replace tildes with blank space
})

-- Theme
vim.cmd.colorscheme("kanagawa-wave")
