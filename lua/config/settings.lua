-- Basic
local o = vim.opt
local sysname = vim.loop.os_uname().sysname

-- Theme
vim.cmd.colorscheme("gruvbox")

vim.cmd 'syntax enable'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
o.clipboard = 'unnamedplus'
o.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('data') .. '/undo'
o.undofile = true
o.linebreak = true

-- Linux used for setting terminal inside nvim
if sysname == "Linux" then
    o.shell = vim.fn.exepath("zsh") or "zsh"
elseif sysname == "Windows_NT" then
    o.shell = "pwsh"
end

-- Line Numbers
o.number = true
o.relativenumber = true

-- Encoding
o.encoding = 'utf-8'

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
o.termguicolors = true
o.cursorline = true
o.fillchars:append({
    eob = " ",
})

-- Transparency
vim.cmd([[
  highlight Normal ctermbg=none guibg=none
  highlight NormalNC ctermbg=none guibg=none
  highlight VertSplit ctermbg=none guibg=none
  highlight StatusLine ctermbg=none guibg=none
  highlight LineNr ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
]])


-- Auto format on save
vim.cmd([[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.format({async = false})
    augroup END
]])
