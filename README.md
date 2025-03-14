# NeoVim Configuration

This repository contains my NeoVim setup with various plugins and custom configurations.

> Configuration is made to suit my needs, some settings or keybinds might not work for you.

## Installation

1. Clone this repository to your local machine.
2. Ensure you have NeoVim installed. If not, you can install it using your package manager.
3. Copy the contents of this repository to your NeoVim configuration directory (usually `~/.config/nvim`).
4. Run nvim Lazy.nvim should do the rest.

## Plugins

This setup uses the `lazy.nvim` plugin manager to manage various plugins. Below is a list of the main plugins included:

- **UI Enhancements**
  - `nvim-lualine/lualine.nvim`: Status line.
  - `nvim-tree/nvim-web-devicons`: File icons.

- **LSP and Autocompletion**
  - `neovim/nvim-lspconfig`: LSP configurations.
  - `hrsh7th/nvim-cmp`: Autocompletion plugin.
  - `hrsh7th/cmp-nvim-lsp`: LSP source for nvim-cmp.
  - `hrsh7th/cmp-buffer`: Buffer source for nvim-cmp.
  - `hrsh7th/cmp-path`: Path source for nvim-cmp.
  - `hrsh7th/cmp-cmdline`: Command line source for nvim-cmp.
  - `hrsh7th/cmp-vsnip`: Snippet source for nvim-cmp.
  - `hrsh7th/vim-vsnip`: Snippet plugin.
  - `williamboman/mason.nvim`: LSP installer.
  - `williamboman/mason-lspconfig.nvim`: Mason LSP configurations.

- **Utilities**
  - `nvim-treesitter/nvim-treesitter`: Treesitter configurations.
  - `nvim-telescope/telescope.nvim`: Fuzzy finder.
  - `nvim-lua/plenary.nvim`: Utility functions.
  - `sindrets/diffview.nvim`: Git diff view.
  - `windwp/nvim-autopairs`: Autopairs.
  - `tpope/vim-fugitive`: Git integration.
  - `numToStr/Comment.nvim`: Commenting utility.
  - `github/copilot.vim`: GitHub Copilot integration.

## Custom Keybindings

Some keybindings might differ or are not included in this table, since I change them regularly.

| Keybinding          | Mode   | Action                                      |
|---------------------|--------|---------------------------------------------|
| `<Esc>`             | `t`    | Exit to normal mode                         |
| `<leader>b`         | `n`    | Next Buffer                                 |
| `<leader>t`         | `n`    | New Tab                                     |
| `<leader>tn`         | `n`    | Next Tab                                     |
| `<leader>tp`         | `n`    | Previous Tab                                     |
| `<leader>q`        | `n`    | Close Tab                                   |
| `<leader>dv`        | `n`    | Open Diffview                               |
| `<leader>fh`        | `n`    | View file history in Diffview               |
| `<C-h>`             | `n`    | Move to the left pane                       |
| `<C-j>`             | `n`    | Move to the pane below                      |
| `<C-k>`             | `n`    | Move to the pane above                      |
| `<C-l>`             | `n`    | Move to the right pane                      |
| `<leader>do`        | `n`    | Open diagnostic float                       |
| `<leader>dp`        | `n`    | Go to the previous diagnostic               |
| `<leader>dn`        | `n`    | Go to the next diagnostic                   |
| `<leader>dl`        | `n`    | List diagnostics using Telescope            |
| `<leader>ff`        | `n`    | Telescope find files                        |
| `<leader>f`         | `n`    | Telescope grep string                         |
| `<leader>fb`        | `n`    | Telescope current buffer fuzzy find         |
| `<leader>fc`        | `n`    | Telescope git commits                       |
| `<leader>fg`        | `n`    | Telescope git files                         |
| `<leader>gd`        | `n`    | Telescope LSP definitions                   |
| `<leader>v`             | `n`    | Enter block mode                            |
| `<leader>v`             | `x`    | Enter block mode                            |
| `<leader>cp`        | `n`    | Copy the path of the current file to clipboard |
| `<leader>gd`        | `n`    | Go to the global definition of the word under the cursor |
| `<leader>o`         | `n`    | Open Oil in current file buffer dir              |

## LSP Configuration

The following LSP servers are configured and installed using `mason.nvim` and `nvim-lspconfig`:

- `pylsp` (Python)
- `html` (HTML)
- `gopls` (Go)
- `jsonls` (JSON)
- `yamlls` (YAML)
- `omnisharp` (C#)
- `ts_ls` (TypeScript)
- `markdown_oxide` (Markdown)
- `cssls` (CSS)
- `lua_ls` (Lua)
- `phpactor` (PHP)

## Settings

The settings for NeoVim are configured in `lua/configurations/settings.lua`.
