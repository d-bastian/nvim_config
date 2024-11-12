" Enable line numbers
set number

set encoding=utf-8
set fileencodings=utf-8,utf-8bom,latin1

" Enable relative line numbers
set relativenumber

" Enable line wrapping
set wrap

" Enable syntax highlighting
syntax enable

" Enable auto-indentation
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Enable searching and auto-highlighting
set incsearch
set hlsearch

" Enable mouse support
set mouse=a

" Enable clipboard support
set clipboard=unnamedplus

" Enable line and column display in status line
set ruler

" Enable status line
set laststatus=2

" Enable cursor line
set cursorline

" Enable background color for the line number column
set number relativenumber

" Enable line number column width
set numberwidth=4


" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Example plugins
Plug 'tpope/vim-sensible'              " A sensible default configuration for Vim
Plug 'neovim/nvim-lspconfig'          " LSP (Language Server Protocol) configuration
Plug 'hrsh7th/nvim-compe'             " Autocompletion plugin
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'  }  " Syntax highlighting via Treesitter
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'junegunn/fzf.vim'               " Fuzzy file search
Plug 'nvim-lua/plenary.nvim'          " Utility functions for Neovim plugins
Plug 'nvim-telescope/telescope.nvim', {'do': ':UpdateRemotePlugins'}  " Fuzzy finder and file search
Plug 'nvim-tree/nvim-tree.lua'

" Airline
Plug 'vim-airline/vim-airline'        " Status line plugin
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'rebelot/kanagawa.nvim'

" AutoCompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'

" Formatter
Plug 'mhartington/formatter.nvim'

" GitHub Copilot
Plug 'github/copilot.vim'


" Finish plugin installation
call plug#end()

" Configurations
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

" Enable airline extensions
let g:airline#extensions#tabline#enabled = 1  " Show tab line
let g:airline#extensions#fugitiveline#enabled = 1  " Git branch in status line
let g:airline#extensions#whitespace#enabled = 1  " Show whitespace characters

" Set the colorscheme for airline
let g:airline_theme='base16'

" Theme
colorscheme kanagawa

" Mappings
" File explorer shortcut
let mapleader = ","

" General Mappings
" Tab Mappings
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" New Tab
nnoremap <leader>t :tabnew<CR>

" Close tab
nnoremap <leader>q :tabclose<CR>

" Nvim Tree Settings
noremap <leader>n :NvimTreeToggle<CR>

" Map Ctrl + h/j/k/l to navigate between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Telescope mappings
nnoremap <C-p> :Telescope find_files hidden=true<CR>
" Telescope enable hidden files

nnoremap <leader>ff :Telescope live_grep<CR>

" Find text in current buffer
nnoremap <leader>fb :Telescope current_buffer_fuzzy_find<CR>

" Split panels
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>hs :split<CR>



" Enable nvim-cmp for autocompletion
let g:completion_enable_auto_popup = 1  " Enable autocompletion popup by default

" Enable GitHub Copilot
let g:copilot_enabled = 1          " Enable Copilot by default
let g:copilot_no_tab_map = 0       " Disable Copilot's default <Tab> mapping" Set up cmp for completion

lua << EOF
    local cmp = require('cmp')

    cmp.setup({
        snippet = {
          expand = function(args)
            -- Use Vim's expand function or LuaSnip (if installed)
            vim.fn['vsnip#expand'](args.body)  -- Or replace with 'luasnip.expand()' if using LuaSnip
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),    -- Select previous item
          ['<C-n>'] = cmp.mapping.select_next_item(),    -- Select next item
          ['<Tab>'] = cmp.mapping.select_next_item(),    -- Same as <C-n>
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),  -- Same as <C-p>
          ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection

        },
        sources = {
          { name = 'nvim_lsp' },   -- LSP completion
          { name = 'buffer' },     -- Buffer completion
          { name = 'path' },       -- Path completion
        },
    })

    require'nvim-tree'.setup {
        -- Configuration options go here
        view = {
          width = 30,                  -- Width of the file explorer window
          side = 'left',               -- Position of the file explorer (left or right)
        },
        renderer = {
          highlight_opened_files = "all",  -- Highlight files that are currently open in Neovim
        },
        diagnostics = {
          enable = true,                -- Enable diagnostics (e.g., error or warning indicators)
          icons = {
            hint = "",                 -- Hint icon
            info = "",                 -- Info icon
            warning = "",              -- Warning icon
            error = "",                -- Error icon
          },
        },
    }

    require'lspconfig'.gopls.setup{}
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.ts_ls.setup{}

    require('formatter').setup({
        logging = false,
        filetype = {
        -- General formatter (for all file types that aren't explicitly set)
            ["*"] = {
              function()
                return {
                  exe = "prettier",  -- Replace with your preferred formatter (e.g., prettier, clang-format, etc.)
                  args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                  stdin = true,
                }
              end
            },

            -- Python formatter
            python = {
              function()
                return {
                  exe = "black",   -- You can use black or another Python formatter
                  args = {"-"},
                  stdin = true,
                }
              end
            },

            -- JavaScript/TypeScript formatter
            javascript = {
              function()
                return {
                  exe = "prettier",
                  args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                  stdin = true,
                }
              end
            },

        }
    })

EOF


