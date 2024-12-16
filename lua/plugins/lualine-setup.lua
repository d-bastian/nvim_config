local custom_theme = require("lualine.themes.moonfly")
custom_theme.normal.c.bg = "#080808"
require("lualine").setup {
    options = { theme = custom_theme },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
}
