require("telescope").setup {
    defaults = {
        layout_config = {
            prompt_position = "bottom"
        },
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
}
