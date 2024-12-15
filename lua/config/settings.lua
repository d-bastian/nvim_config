-- Vim Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8', 'utf-8bom', 'latin1' }
vim.opt.wrap = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.cmd('syntax enable')
vim.cmd('filetype plugin on')
vim.cmd.colorscheme("moonfly")
vim.opt.fillchars:append({
    eob = " ", -- Replace tildes with blank space
})
vim.opt.termguicolors = true
