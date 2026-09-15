require("telescope").setup({
    defaults = {
        layout_config = {
            vertical = { width = 0.80 },
        },
    },
    pickers = {
        find_files = {
            theme = "ivy",
        },
        git_commits = {
            theme = "ivy",
        },
        live_grep = {
            theme = "ivy",
        },
        grep_string = {
            theme = "ivy",
        },
        git_files = {
            theme = "ivy",
        },
        buffers = {
            theme = "ivy",
        },
        diagnostics = {
            theme = "ivy",
        },
    },
})
