# NeoVim Configuration

This repository contains my NeoVim setup with various plugins and custom configurations to enhance development experience.

## Table of Contents

- [NeoVim Configuration](#neovim-configuration)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Plugins](#plugins)
  - [Custom Keybindings](#custom-keybindings)
  - [LSP Configuration](#lsp-configuration)
  - [Settings](#settings)
  - [Screenshots](#screenshots)

## Installation

1. Clone this repository to your local machine.
2. Ensure you have NeoVim installed. If not, you can install it using your package manager.
3. Copy the contents of this repository to your NeoVim configuration directory (usually `~/.config/nvim`).
4. Run nvim Lazy.nvim should do the rest.

## Plugins

This setup uses the `lazy.nvim` plugin manager to manage various plugins. Below is a list of the main plugins included:

- **UI Enhancements**
  - `nvim-lualine/lualine.nvim`: Status line.
  - `nvim-tree/nvim-tree.lua`: File explorer.
  - `nvim-tree/nvim-web-devicons`: File icons.
  - `MeanderingProgrammer/render-markdown.nvim`: Markdown rendering.

- **Themes**
  - `bluz71/vim-moonfly-colors`
  - `rebelot/kanagawa.nvim`
  - `folke/tokyonight.nvim`
  - `bluz71/vim-nightfly-colors`
  - `NLKNguyen/papercolor-theme`
  - `elissonleao/gruvbox.nvim`

- **LSP and Autocompletion**
  - `neovim/nvim-lspconfig`: LSP configurations.
  - `hrsh7th/nvim-cmp`: Autocompletion plugin.
  - `hrsh7th/cmp-nvim-lsp`: LSP source for nvim-cmp.
  - `hrsh7th/cmp-buffer`: Buffer source for nvim-cmp.
  - `hrsh7th/cmp-path`: Path source for nvim-cmp.
  - `hrsh7th/cmp-cmdline`: Command line source for nvim-cmp.
  - `hrsh7th/cmp-vsnip`: Snippet source for nvim-cmp.
  - `hrsh7th/vim-vsnip`: Snippet plugin.

- **Utilities**
  - `nvim-treesitter/nvim-treesitter`: Treesitter configurations.
  - `williamboman/mason.nvim`: LSP installer.
  - `williamboman/mason-lspconfig.nvim`: Mason LSP configurations.
  - `nvim-telescope/telescope.nvim`: Fuzzy finder.
  - `nvim-lua/plenary.nvim`: Utility functions.
  - `sindrets/diffview.nvim`: Git diff view.
  - `windwp/nvim-autopairs`: Autopairs.
  - `tpope/vim-fugitive`: Git integration.
  - `numToStr/Comment.nvim`: Commenting utility.
  - `github/copilot.vim`: GitHub Copilot integration.

## Custom Keybindings

| Mode | Keybind       | Command                                | Description                          |
|------|---------------|----------------------------------------|--------------------------------------|
| t    | `<Esc>`       | `<C-\><C-n>`                           | Exit terminal mode                   |
| n    | `<leader>b`   | `:bn<CR>`                              | Next buffer                          |
| n    | `<leader>t`   | `:tabnew<CR>`                          | New tab                              |
| n    | `<leader>q`   | `:tabclose<CR>`                        | Close tab                            |
| n    | `<leader>dv`  | `:DiffviewOpen<CR>`                    | Open Diffview                        |
| n    | `<leader>fh`  | `:DiffviewFileHistory<CR>`             | Open Diffview file history           |
| n    | `<leader>df`  | `:windo diffthis<CR>`                  | Diff this window                     |
| n    | `<leader>n`   | `:NvimTreeToggle<CR>`                  | Toggle NvimTree                      |
| n    | `<C-h>`       | `<C-w>h`                               | Move to left pane                    |
| n    | `<C-j>`       | `<C-w>j`                               | Move to bottom pane                  |
| n    | `<C-k>`       | `<C-w>k`                               | Move to top pane                     |
| n    | `<C-l>`       | `<C-w>l`                               | Move to right pane                   |
| n    | `<leader>do`  | `vim.diagnostic.open_float`            | Open diagnostic float                |
| n    | `<leader>dp`  | `vim.diagnostic.goto_prev`             | Go to previous diagnostic            |
| n    | `<leader>dn`  | `vim.diagnostic.goto_next`             | Go to next diagnostic                |
| n    | `<leader>ff`  | `builtin.find_files`                   | Telescope find files                 |
| n    | `<leader>f`   | `builtin.live_grep`                    | Telescope live grep                  |
| n    | `<leader>fb`  | `builtin.current_buffer_fuzzy_find`    | Telescope buffers                    |
| n    | `<leader>fc`  | `builtin.git_commits`                  | Telescope git commits                |
| n    | `<leader>fg`  | `builtin.git_files`                    | Telescope git files                  |
| n    | `<leader>gd`  | `builtin.lsp_definitions`              | Telescope LSP definitions            |
| n    | `<leader>h`   | `builtin.help_tags`                    | Telescope help tags                  |
| n    | `<leader>dl`  | `builtin.lsp_document_diagnostics`     | Telescope LSP document diagnostics   |
| n    | `<leader>v`   | `<C-v>`                                | Enter block mode                     |
| x    | `<leader>v`   | `<C-v>`                                | Enter block mode                     |
| n    | `<leader>cp`  | `:let @+=expand("%:p")<CR>`            | Copy current file path to clipboard  |
| n    | `<leader>o`   | `:Oil<CR>`                             | Open Oil                             |

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

The settings for NeoVim are configured in [lua/config/settings.lua](lua/config/settings.lua). Key settings include:

- Leader key set to `,`
- Clipboard set to `unnamedplus`
- Line numbers enabled
- UTF-8 encoding
- Auto indentation and smart indentation
- Search settings
- Display settings
- Theme set to `kanagawa-wave`

## Screenshots

![Preview](resources/preview.png)
