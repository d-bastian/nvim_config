-- Netrw Disabling (Best practice)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Settings
require("config.lazy")
require("config.settings")
require("config.keybinds")

-- Plugins customizations
require("customize.mason-setup")
require("customize.oil-setup")
require("customize.mini-setup")
