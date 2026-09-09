local map = vim.keymap.set

local opts = {
    silent = true,
    noremap = true,
}

-- Terminal
map("t", "<Esc>", [[<C-\><C-n>]], {
    desc = "Exit terminal mode",
    silent = true,
})

-- Format buffer
map("n", "<leader>fm", function()
    vim.lsp.buf.format({
        async = true,
        timeout_ms = 3000,
    })
end, {
    desc = "Format buffer",
})

-- Buffers / Tabs
map("n", "<leader>b", "<cmd>bnext<CR>", {
    desc = "Next buffer",
    silent = true,
})

map("n", "<leader>t", "<cmd>tabnew<CR>", {
    desc = "New tab",
    silent = true,
})

map("n", "<leader>q", "<cmd>tabclose<CR>", {
    desc = "Close tab",
    silent = true,
})

map("n", "<leader>tn", "<cmd>tabnext<CR>", {
    desc = "Next tab",
    silent = true,
})

map("n", "<leader>tp", "<cmd>tabprevious<CR>", {
    desc = "Previous tab",
    silent = true,
})

-- Quickfix
map("n", "<leader>qo", "<cmd>copen<CR>", {
    desc = "Open quickfix",
    silent = true,
})

map("n", "<leader>qc", "<cmd>cclose<CR>", {
    desc = "Close quickfix",
    silent = true,
})

-- Diffview
map("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", {
    desc = "Open Diffview",
    silent = true,
})

map("n", "<leader>fh", "<cmd>DiffviewFileHistory<CR>", {
    desc = "File history",
    silent = true,
})

map("n", "<leader>df", "<cmd>DiffviewFileHistory %<CR>", {
    desc = "Current file history",
    silent = true,
})

-- Movement
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

map("n", "<C-h>", "<C-w>h", {
    desc = "Move to left window",
    silent = true,
})

map("n", "<C-j>", "<C-w>j", {
    desc = "Move to lower window",
    silent = true,
})

map("n", "<C-k>", "<C-w>k", {
    desc = "Move to upper window",
    silent = true,
})

map("n", "<C-l>", "<C-w>l", {
    desc = "Move to right window",
    silent = true,
})

-- Diagnostics
map("n", "<leader>do", vim.diagnostic.open_float, {
    desc = "Open diagnostic float",
})

map("n", "<leader>dp", function()
    vim.diagnostic.jump({
        count = -1,
        float = true,
    })
end, {
    desc = "Previous diagnostic",
})

map("n", "<leader>dn", function()
    vim.diagnostic.jump({
        count = 1,
        float = true,
    })
end, {
    desc = "Next diagnostic",
})

-- Telescope
map("n", "<leader>fd", function()
    require("telescope.builtin").diagnostics()
end, {
    desc = "Find diagnostics",
})

map("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
end, {
    desc = "Find files",
})

map("n", "<leader>fg", function()
    require("telescope.builtin").git_files()
end, {
    desc = "Find Git files",
})

map("n", "<leader>fw", function()
    require("telescope.builtin").grep_string()
end, {
    desc = "Find word under cursor",
})

map("n", "<leader>fl", function()
    require("telescope.builtin").live_grep()
end, {
    desc = "Find text",
})

map("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
end, {
    desc = "Find buffers",
})

map("n", "<leader>gd", function()
    require("telescope.builtin").lsp_definitions()
end, {
    desc = "Go to definition",
})

map("n", "<leader>gc", function()
    require("telescope.builtin").git_commits()
end, {
    desc = "Git commits",
})

-- Copy current file path
map("n", "<leader>cp", function()
    vim.fn.setreg("+", vim.fn.expand("%:p"))
    vim.notify("Copied file path")
end, {
    desc = "Copy file path",
})

-- Oil
map("n", "<leader>o", "<cmd>Oil<CR>", {
    desc = "Open Oil",
    silent = true,
})

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", {
    desc = "Move selection down",
    silent = true,
})

map("v", "K", ":m '<-2<CR>gv=gv", {
    desc = "Move selection up",
    silent = true,
})
