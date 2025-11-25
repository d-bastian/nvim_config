vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Buffer / Tabs
vim.api.nvim_set_keymap('n', '<leader>b', ':bn<CR>', { noremap = true, silent = true })       -- Next Buffer
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })   -- New Tab
vim.api.nvim_set_keymap('n', '<leader>q', ':tabclose<CR>', { noremap = true, silent = true }) -- Close Tab
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabn<CR>', { noremap = true, silent = true })    -- Next tab
vim.api.nvim_set_keymap('n', '<leader>tp', ':tabp<CR>', { noremap = true, silent = true })    -- Previous tab

-- Quickfix
vim.api.nvim_set_keymap('n', '<leader>qo', ':copen<CR>', { noremap = true, silent = true })  -- Open quickfix list
vim.api.nvim_set_keymap('n', '<leader>qc', ':cclose<CR>', { noremap = true, silent = true }) -- Close quickfix list

-- Diffs
vim.api.nvim_set_keymap('n', '<leader>dv', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':DiffviewFileHistory<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>df', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true })

-- Movements
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Diagnostics
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' }) -- Find files
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find files' })  -- Git files
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = 'Telescope LSP definitions' })
vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>f', builtin.grep_string, { desc = 'Telescope grep' })

-- Block Mode
vim.api.nvim_set_keymap('n', '<leader>v', '<C-v>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<leader>v', '<C-v>', { noremap = true, silent = true })

-- Copying path of current file to clipboard
vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Oil
vim.api.nvim_set_keymap('n', '<leader>o', ':Oil<CR>', { noremap = true, silent = true })

-- Great Remaps
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
