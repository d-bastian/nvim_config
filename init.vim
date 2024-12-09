set number relativenumber
set encoding=utf-8
set fileencodings=utf-8,utf-8bom,latin1
set wrap
set autoindent smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set incsearch
set hlsearch
set mouse=a
set clipboard=unnamedplus
set shell=powershell
syntax enable
filetype plugin on

call plug#begin('~/.local/share/nvim/plugged')

" Main plugins
Plug 'tpope/vim-sensible'              " A sensible default configuration for Vim
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'  }  " Syntax highlighting via Treesitter
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'junegunn/fzf.vim'               " Fuzzy file search
Plug 'nvim-lua/plenary.nvim'          " Utility functions for Neovim plugins
Plug 'nvim-telescope/telescope.nvim', {'do': ':UpdateRemotePlugins'}  " Fuzzy finder and file search
Plug 'preservim/nerdcommenter'       " Commenting plugin
Plug 'sindrets/diffview.nvim'     " Git diff viewer plug#begin
Plug 'windwp/nvim-autopairs'    " Auto pairs
Plug 'github/copilot.vim'   " GitHub Copilot
Plug 'nvim-tree/nvim-tree.lua'  " File explorer
Plug 'nvim-tree/nvim-web-devicons' " Icons for file explorer
Plug 'vim-airline/vim-airline'        " Status line plugin
Plug 'vim-airline/vim-airline-themes' " Themes for airline

" AutoCompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Themes
Plug 'bluz71/vim-moonfly-colors'

call plug#end()


" Custom mappings 
let mapleader = ","

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>b :bn<CR> " Next Buffer

nnoremap <leader>t :tabnew<CR>
nnoremap <leader>q :tabclose<CR>
nnoremap <leader>pp :terminal<CR>

nnoremap <leader>dv :DiffviewOpen<CR>
nnoremap <leader>fh :DiffviewFileHistory<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>f :Telescope find_files hidden=true<CR>
nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope current_buffer_fuzzy_find<CR>

nnoremap <leader>n :NvimTreeToggle<CR>

" Configurations
let g:airline#extensions#tabline#enabled = 1  " Show tab line
let g:airline#extensions#fugitiveline#enabled = 1  " Git branch in status line
let g:airline#extensions#whitespace#enabled = 1  " Show whitespace characters
let g:airline#extensions#tabline#formatter = 'default'  " Tab line formatter
let g:airline#extensions#tabline#left_sep = ' '  " Left separator
let g:airline#extensions#tabline#left_alt_sep = '|'  " Left alternative separator
let g:airline#extensions#tabline#right_sep = ' '  " Right separator
let g:airline#extensions#tabline#right_alt_sep = '|'  " Right alternative separator
let g:airline_theme='base16'

colorscheme moonfly

" Nvim CMP
let g:completion_enable_auto_popup = 1  " Enable autocompletion popup by default

" Github Copilot
let g:copilot_enabled = 1          " Enable Copilot by default
let g:copilot_no_tab_map = 0       " Disable Copilot's default <Tab> mapping" Set up cmp for completion

lua << EOF

      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
        }, {
          { name = 'buffer' },
        })
      })

    --  LSP 
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<leader>r', vim.diagnostic.goto_next, opts)

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

    -- File Explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      -- Important for larger directories 
      git = {
          enable = false
          }
    })

EOF

