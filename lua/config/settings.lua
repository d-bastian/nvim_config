-- Basic
local o = vim.opt

-- Theme
vim.cmd.colorscheme("dracula")

vim.cmd 'syntax enable'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
o.clipboard = 'unnamedplus'
o.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('data') .. '/undo'
o.undofile = true
o.linebreak = true

-- Not setting shell and defaulting if zsh not found
if vim.fn.exepath("zsh") ~= "" then
    o.shell = vim.fn.exepath("zsh") or "zsh"
else
    print("Zsh is not found")
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
