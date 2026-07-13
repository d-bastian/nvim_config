-- Netrw Disabling (Best practice)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Settings
require("config.lazy")
require("config.settings")
require("config.keybinds")

-- Plugins
require("customize.mason-setup")
require("customize.lualine-setup")
require("customize.oil-setup")
