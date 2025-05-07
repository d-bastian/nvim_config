# NeoVim Configuration

This repository contains my NeoVim setup with various plugins and custom configurations.
Yes

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
  - `nvim-treesitter/nvim-treesitter`: Treesitter configurations.
  - `nvim-telescope/telescope.nvim`: Fuzzy finder.
  - `nvim-lua/plenary.nvim`: Utility functions.
  - `sindrets/diffview.nvim`: Git diff view.
  - `tpope/vim-fugitive`: Git integration.
  - `numToStr/Comment.nvim`: Commenting utility.

## Custom Keybindings

Some keybindings might differ or are not included in this table, since I change them regularly.

| Mode  | Keybinding    | Action                                  |
|-------|-------------|-----------------------------------------|
| `t`   | `<Esc>`     | Exit terminal mode                     |
| `n`   | `<leader>b` | Next buffer                            |
| `n`   | `<leader>t` | Open new tab                           |
| `n`   | `<leader>q` | Close current tab                      |
| `n`   | `<leader>tn`| Switch to next tab                     |
| `n`   | `<leader>tp`| Switch to previous tab                 |
| `n`   | `<leader>dv`| Open Diffview                          |
| `n`   | `<leader>fh`| Open file history in Diffview          |
| `n`   | `<leader>df`| Show current file history in Diffview  |
| `n`   | `<C-d>`     | Scroll down and center cursor         |
| `n`   | `<C-u>`     | Scroll up and center cursor           |
| `n`   | `<C-h>`     | Move to left window                   |
| `n`   | `<C-j>`     | Move to below window                  |
| `n`   | `<C-k>`     | Move to above window                  |
| `n`   | `<C-l>`     | Move to right window                  |
| `n`   | `<leader>do`| Open floating diagnostics window      |
| `n`   | `<leader>dp`| Jump to previous diagnostic           |
| `n`   | `<leader>dn`| Jump to next diagnostic               |
| `n`   | `<leader>dl`| Open diagnostics in Telescope        |
| `n`   | `<leader>ff`| Find files using Telescope           |
| `n`   | `<leader>gd`| Go to LSP definition via Telescope   |
| `n`   | `<leader>bf`| List open buffers via Telescope      |
| `n`   | `<leader>f` | Grep string in project via Telescope |
| `n/x` | `<leader>v` | Enter visual block mode               |
| `n`   | `<leader>cp`| Copy file path to clipboard          |
| `n`   | `<leader>o` | Open Oil file explorer               |
| `v`   | `J`         | Move selected text down              |
| `v`   | `K`         | Move selected text up                |

## LSP Configuration

LSP servers are configured and installed using `mason.nvim` and `nvim-lspconfig`.

You can edit them in lua/customize/mason-setup.lua.

## Settings

The settings for NeoVim are configured in `lua/configurations/settings.lua`.
