-- empty setup using defaults
require('nvim-tree').setup({
    sort_by = "case_sensitive",          -- Sort files case-sensitively
    renderer = {
        add_trailing = true,             -- Add trailing slash to folders
        highlight_git = true,            -- Highlight Git changes
        highlight_opened_files = "name", -- Highlight opened files
        root_folder_label = ":~:s?",     -- Display root folder in custom format
        icons = {
            glyphs = {
                folder = {
                    default = "",
                    open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                },
            },
        },
    },
    diagnostics = {
        enable = true, -- Show diagnostics in the tree
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = true,                     -- Show hidden files
        custom = { ".git", "node_modules" }, -- Exclude specific directories
    },
    git = {
        enable = false, -- Enable Git integration
        ignore = false, -- Show ignored files
    },
})
