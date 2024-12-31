-- Settings
require("config.lazy")
require("config.settings")

-- Plugins
require("plugins.treesitter-setup")
require("plugins.mason-setup")
require("config.keybinds")
require("plugins.nvimtree")
require("plugins.lualine-setup")
require("plugins.cmp-setup")
require("plugins.render-markdown-setup")
require("plugins.telescope-setup")
require("ibl").setup()
require("nvim-autopairs").setup {}
require("plugins.oil-setup")
