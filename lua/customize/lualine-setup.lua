require('lualine').setup {
    options = {
        theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'FugitiveHead' }, 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
    },
}
