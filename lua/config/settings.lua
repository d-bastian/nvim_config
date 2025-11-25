-- Basic
local opt = vim.opt
local sysname = vim.loop.os_uname().sysname

-- Theme
vim.cmd.colorscheme("gruvbox")

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

-- Linux
if sysname == "Linux" then
    opt.shell = vim.fn.exepath("zsh") or "zsh"
elseif sysname == "Windows_NT" then
    opt.shell = "pwsh"
end

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
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Display
opt.wrap = true
opt.mouse = 'a'
opt.termguicolors = true
opt.cursorline = true
opt.fillchars:append({
    eob = " ",
})

-- Auto format on save
vim.cmd([[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.format({async = false})
    augroup END
]])
