-- Settings
require("config.lazy")
require("config.settings")
require("config.keybinds")

-- Plugins
require("customize.treesitter-setup")
require("customize.mason-setup")
require("customize.nvimtree")
require("customize.lualine-setup")
require("customize.cmp-setup")
require("customize.render-markdown-setup")
require("customize.telescope-setup")
require("customize.oil-setup")
require("customize.indent-blankline-setup")

require("gitsigns").setup()
require("nvim-autopairs").setup {}
