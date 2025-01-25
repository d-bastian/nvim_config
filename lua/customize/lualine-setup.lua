local custom_theme = require("lualine.themes.modus-vivendi")
require("lualine").setup {
    options = { theme = custom_theme, component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' }, },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
}
