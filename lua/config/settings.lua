-- Option alias
local opt = vim.opt

-- Colorscheme
vim.cmd.colorscheme("gruber-dark")

-- Clipboard
opt.clipboard = "unnamedplus"

-- Backups / Undo
opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Shell
local zsh = vim.fn.exepath("zsh")

if zsh ~= "" then
    opt.shell = zsh
end

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.autoindent = true
opt.smartindent = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Folding
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Display
opt.wrap = false
opt.linebreak = true
opt.cursorline = true

opt.mouse = "a"

opt.fillchars:append({
    eob = " ",
})

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Editing
opt.backspace = {
    "indent",
    "eol",
    "start",
}

-- Faster updates
opt.updatetime = 250
opt.timeoutlen = 1000

-- Completion menu
opt.completeopt = {
    "menu",
    "menuone",
    "noselect",
}

-- Fixing yaml using wrong identation
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yaml", "yaml.ansible" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})
