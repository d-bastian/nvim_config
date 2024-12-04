"Enable line numbers
set number

" Line Comments
filetype plugin on

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

" Main plugins
Plug 'tpope/vim-sensible'              " A sensible default configuration for Vim
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'  }  " Syntax highlighting via Treesitter
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'junegunn/fzf.vim'               " Fuzzy file search
Plug 'nvim-lua/plenary.nvim'          " Utility functions for Neovim plugins
Plug 'nvim-telescope/telescope.nvim', {'do': ':UpdateRemotePlugins'}  " Fuzzy finder and file search
Plug 'preservim/nerdcommenter'       " Commenting plugin
Plug 'sindrets/diffview.nvim'

" Airline
Plug 'vim-airline/vim-airline'        " Status line plugin
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'rebelot/kanagawa.nvim'
Plug 'ribru17/bamboo.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" AutoCompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" GitHub Copilot
Plug 'github/copilot.vim'

" Auto pair
Plug 'windwp/nvim-autopairs'

" Treesitter plugins
Plug 'hiphish/rainbow-delimiters.nvim'

" Plugins for testing
Plug 'MeanderingProgrammer/render-markdown.nvim'

" Finish plugin installation
call plug#end()

" Configurations

" Enable airline extensions
let g:airline#extensions#tabline#enabled = 1  " Show tab line
let g:airline#extensions#fugitiveline#enabled = 1  " Git branch in status line
let g:airline#extensions#whitespace#enabled = 1  " Show whitespace characters

" Set the colorscheme for airline
let g:airline_theme='base16'

" Theme
colorscheme kanagawa
" Mappings

let mapleader = ","

" Tab Mappings
nnoremap <leader>b :bn<CR>

" New Tab
nnoremap <leader>t :tabnew<CR>

" Close tab
nnoremap <leader>q :tabclose<CR>

" diffview
nnoremap <leader>dv :DiffviewOpen<CR>

" Map Ctrl + h/j/k/l to navigate between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Telescope mappings
nnoremap <C-p> :Telescope find_files hidden=true<CR>
" Telescope enable hidden files

" Find text in files
nnoremap <leader>ff :Telescope live_grep<CR>

" Find text in current buffer
nnoremap <leader>fb :Telescope current_buffer_fuzzy_find<CR>

" Enable nvim-cmp for autocompletion
let g:completion_enable_auto_popup = 1  " Enable autocompletion popup by default

" Enable GitHub Copilot
let g:copilot_enabled = 1          " Enable Copilot by default
let g:copilot_no_tab_map = 0       " Disable Copilot's default <Tab> mapping" Set up cmp for completion

" Prettier Configuration
autocmd BufWritePre * :Prettier
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 4
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#bracket_spacing = 1

lua << EOF

    local cmp = require'cmp'

    -- Global setup.
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
      }, {
        { name = 'buffer' },
      })
    })

    --  LSP Configurations
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require'lspconfig'.gopls.setup{}
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.ts_ls.setup{}

    -- Powershell LSP
    require'lspconfig'.powershell_es.setup{
        bundle_path = 'C:/lspservices/PowerShellEditorServices',
        shell = 'powershell.exe'
    }
    

    require'lspconfig'.jsonls.setup {
        commands = {
          Format = {
            function()
              vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
            end
          }
        }
    }

    -- HTML, CSS, YAML, VIM LSP

    require'lspconfig'.html.setup {
      capabilities = capabilities,
    }
    require'lspconfig'.cssls.setup{
        capabilities = capabilities,
    }
    require'lspconfig'.yamlls.setup{}
    require'lspconfig'.vimls.setup{}

    -- Csharp LSP
    local omnisharp_bin = 'c:/lspservices/omnisharp-win-x64/OmniSharp.exe'
    require'lspconfig'.omnisharp.setup{
        cmd = { omnisharp_bin , '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
    }

    require'nvim-treesitter.configs'.setup {
        highlight = {
            enable = true,
        },
    }

    -- Autopairs configs
    require('nvim-autopairs').setup{}

    -- Custom theme setup
    require('kanagawa').load(dragon)

    -- Custom
    require('render-markdown').setup()

EOF

