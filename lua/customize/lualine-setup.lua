local custom_theme = require('lualine.themes.auto')
require('lualine').setup {
    options = {
        theme = custom_theme,
        section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'FugitiveHead' }, 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'filesize' },
        lualine_z = { 'location' }
    },
}
