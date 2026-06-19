# NeoVim Configuration

This repository contains my NeoVim setup with various plugins and custom configurations.

> Configuration is made to suit my needs, some settings or keybinds might not work for you.

## Installation

1. Clone this repository to your local machine.
2. Ensure you have NeoVim installed. If not, you can install it using your package manager.
3. Copy the contents of this repository to your NeoVim configuration directory (usually `~/.config/nvim`).
4. Run nvim Lazy.nvim should do the rest.

Run `:checkhealth` after plugins are installed.  

## Plugins

This setup uses the `lazy.nvim` plugin manager to manage various plugins. Below is a list of the main plugins included:

- **UI Enhancements**
  - `nvim-lualine/lualine.nvim`: Status line.
  - `nvim-tree/nvim-web-devicons`: File icons.

- **LSP and Autocompletion**
  - `neovim/nvim-lspconfig`: LSP configurations.
  - `williamboman/mason.nvim`: LSP installer.
  - `williamboman/mason-lspconfig.nvim`: Mason LSP configurations.
  - `Saghen/blink.cmp`: Autocompletion

- **Utilities**
  - `nvim-telescope/telescope.nvim`: Fuzzy finder.
  - `nvim-lua/plenary.nvim`: Utility functions.
  - `sindrets/diffview.nvim`: Git diff view.
  - `tpope/vim-fugitive`: Git integration.
  - `numToStr/Comment.nvim`: Commenting utility.

## Custom Keybindings

Defined keybinds can be found in `lua/config/keybinds.lua`.

## LSP Configuration

LSP servers are configured and installed using `mason.nvim` and `nvim-lspconfig`.

You can edit them in `lua/customize/mason-setup.lua`.

## Settings

The settings for NeoVim are configured in `lua/config/settings.lua`.
