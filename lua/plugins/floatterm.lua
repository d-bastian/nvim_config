local state = {
    floating = {
        win = -1,
        buf = -1
    }
}

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    -- Calculate the starting position to center the floating window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- Create a new buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- 'false' means the buffer is not listed; 'true' makes it scratch
    end

    -- Open the floating window
    local win_config = {
        relative = "editor", -- Position relative to the entire editor
        width = width,       -- Width of the floating window
        height = height,     -- Height of the floating window
        row = row,           -- Vertical position
        col = col,           -- Horizontal position
        style = "minimal",   -- Minimal style (no extra UI elements)
        border = "rounded"
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return {
        buf = buf,
        win = win
    }
end

local toggle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window { buf = state.floating.buf }

        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd("terminal")
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.keymap.set({ "n", "t" }, "<space>tt", toggle_terminal)
