# NeoVim Configuration

This repository is my personal NeoVim setup, built around `lazy.nvim` and tuned for fast navigation, LSP-driven editing, and Git-heavy development.

> This config is tailored to my workflow, so some defaults and keymaps may not match yours exactly.
> The config expects NeoVim 0.10 or newer.

## Installation

1. Clone this repository to your local machine.
2. Make sure Neovim and Git are installed.
3. Copy the repository contents into your Neovim config directory, typically `~/.config/nvim`.
4. Launch Neovim and let `lazy.nvim` install the plugins.
5. Run `:checkhealth` and `:Lazy sync` if anything is missing or outdated.

## Current setup

- `lazy.nvim` for plugin management
- `gruvbox.nvim` as the active default colorscheme
- `mini.nvim` utilities for pairs, comments, surrounds, statusline, and tabline
- completion with `blink.cmp` and `blink-ripgrep`
- formatting with `conform.nvim`
- LSP and tool installation via `mason.nvim` + `mason-lspconfig.nvim` + `nvim-lspconfig`
- file browsing with `oil.nvim`
- fuzzy finding and search with `telescope.nvim`
- git integration with `vim-fugitive`, `diffview.nvim`, and `gitsigns.nvim`

## Plugins in use

### Core utilities

- `tpope/vim-fugitive` — Git commands from inside Neovim
- `sindrets/diffview.nvim` — git diff and file history views
- `HiPhish/rainbow-delimiters.nvim` — colored bracket pairs
- `lewis6991/gitsigns.nvim` — git markers and inline blame
- `saghen/blink.indent` — indentation guides with active scope highlighting

### Mini.nvim

- `nvim-mini/mini.pairs` — auto-pairs
- `nvim-mini/mini.comment` — comment toggling
- `nvim-mini/mini.surround` — surround operations
- `nvim-mini/mini.statusline` — compact statusline
- `nvim-mini/mini.tabline` — lightweight tab labels
- `nvim-mini/mini.icons` — icons for other plugins such as Oil

### Completion, snippets, and formatting

- `saghen/blink.cmp` — completion engine
- `rafamadriz/friendly-snippets` — snippet library
- `mikavilpas/blink-ripgrep.nvim` — ripgrep-powered completion source
- `stevearc/conform.nvim` — formatting wrapper for code formatters

### LSP and tooling

- `mason-org/mason.nvim` — tool installer
- `mason-org/mason-lspconfig.nvim` — installs and manages LSP servers
- `neovim/nvim-lspconfig` — LSP configuration layer

Installed LSPs currently include:

- `gopls`
- `lua_ls`
- `pylsp`
- `yamlls`
- `jsonls`
- `ts_ls`
- `docker_compose_language_service`
- `roslyn_ls`

### Navigation and file browsing

- `nvim-telescope/telescope.nvim` — file search, diagnostics, and grep
- `nvim-lua/plenary.nvim` — dependency for Telescope
- `stevearc/oil.nvim` — file explorer in a buffer-based style

### Themes

The repo ships with several theme options, while the active default is currently `gruvbox`:

- `projekt0n/github-nvim-theme`
- `tanvirtin/monokai.nvim`
- `ellisonleao/gruvbox.nvim`
- `p00f/alabaster.nvim`
- `Mofiqul/dracula.nvim`
- `olimorris/onedarkpro.nvim`
- `d-bastian/gruber-dark.nvim`

## Editor settings

The config is defined in `lua/config/settings.lua` and includes:

- leader key: `,`
- system clipboard enabled via `unnamedplus`
- line numbers and relative line numbers
- 4-space indentation with tabs expanded to spaces
- smart case-insensitive search
- folding based on indentation
- `cursorline` enabled
- `scrolloff` and `sidescrolloff` set to 8
- splits open below/right by default
- persistent undo enabled
- `termguicolors` enabled
- `colorcolumn` set to 160
- mouse support enabled
- `zsh` used as the shell when available

## Keybindings

The main shortcuts are defined in `lua/config/keybinds.lua`.

### General

- `<Esc>` in terminal mode: exit terminal mode
- `<leader>fm`: format buffer via LSP
- `<leader>fc`: format buffer via `conform.nvim`
- `<leader>b`: next buffer
- `<leader>t`: new tab
- `<leader>tq`: close tab
- `<leader>tn`: next tab
- `<leader>tp`: previous tab
- `<leader>qo`: open quickfix
- `<leader>qc`: close quickfix

### Window and movement

- `<C-d>` / `<C-u>`: half-page movement with centering
- `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`: move between windows
- `<leader>v`: block selection mode (`Ctrl+V`)

### Diagnostics

- `<leader>do`: open diagnostics float
- `<leader>dp`: previous diagnostic
- `<leader>dn`: next diagnostic

### Telescope

- `<leader>fd`: find diagnostics
- `<leader>ff`: find files
- `<leader>fg`: find git files
- `<leader>fw`: find word under cursor
- `<leader>fl`: live grep
- `<leader>fb`: find buffers
- `<leader>gd`: go to definition
- `<leader>gc`: git commits

### Git and file tools

- `<leader>dv`: open Diffview
- `<leader>fh`: file history
- `<leader>df`: current file history
- `<leader>tb`: toggle current line blame
- `<leader>hd`: diff current file
- `<leader>tg`: full blame for current buffer
- `<leader>cp`: copy current file path
- `<leader>o`: open Oil

### Editing helpers

- `J` / `K` in visual mode: move selected lines down/up

## LSP configuration

Additional LSP customization lives in `lua/customize/mason-setup.lua`, including:

- Python lint settings for `pylsp` with a max line length of 120 and ignoring `W391`
- Lua diagnostics tuning for `lua_ls`
- Go formatting with `gofumpt`
- JSON validation and formatting

## Notes

This setup is built to be clean, practical, and fast for everyday editing. If you want to tweak the layout, colors, or keymaps, the relevant files are:

- `init.lua`
- `lua/config/settings.lua`
- `lua/config/keybinds.lua`
- `lua/config/lazy.lua`
- `lua/plugins/plugins.lua`
- `lua/themes/themes.lua`

![Preview](preview.png)
