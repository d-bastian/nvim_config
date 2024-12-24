vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Buffer / Tabs
vim.api.nvim_set_keymap('n', '<leader>b', ':bn<CR>', { noremap = true, silent = true })       -- Next Buffer
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })   -- New Tab
vim.api.nvim_set_keymap('n', '<leader>q', ':tabclose<CR>', { noremap = true, silent = true }) -- Close Tab

-- Diffs
vim.api.nvim_set_keymap('n', '<leader>dv', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':DiffviewFileHistory<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>df', ':windo diffthis<CR>', { noremap = true, silent = true })

-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Pane movement
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
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope live grep' }) -- Find text in files
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Telescope git commits' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { buffer = 0, desc = 'Telescope lsp definitions' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })

-- Block Mode
vim.api.nvim_set_keymap('n', '<leader>v', '<C-v>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<leader>v', '<C-v>', { noremap = true, silent = true })

-- Copying path of current file to clipboard
vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Oil
vim.api.nvim_set_keymap('n', '<leader>o', ':Oil<CR>', { noremap = true, silent = true })
