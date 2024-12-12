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
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

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
let g:airline_theme='distinguished'  " Airline theme

colorscheme moonfly

" Nvim CMP
let g:completion_enable_auto_popup = 1  " Enable autocompletion popup by default

" Github Copilot
let g:copilot_enabled = 1          " Enable Copilot by default
let g:copilot_no_tab_map = 0       " Disable Copilot's default <Tab> mapping" Set up cmp for completion

lua << EOF
-- Key mappings
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
vim.keymap.set("n", "<leader>r", vim.diagnostic.goto_next, opts)

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { 
        "pylsp", "html", "gopls", "jsonls", "vimls", 
        "yamlls", "omnisharp", "ts_ls", "markdown_oxide", 
        "cssls", "lua_ls"
    },
    automatic_installation = true, 
})

-- LSP setup
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup{}
    end,
})

-- Completion setup
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered({
            col_offset = -3,
            side_padding = 0,
            max_width = 80,
        }),
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
    }, {
        { name = "buffer" },
        { name = "path" },
    }),
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                vsnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name] or ""
            return vim_item
        end
    },
})

-- Autopairs setup
require("nvim-autopairs").setup{}

-- Nvim-tree setup
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
    git = {
        enable = false
    }
})

-- Auto format on save
vim.cmd([[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.format({async = false})
    augroup END
]])

-- Render markdown setup
require("render-markdown").setup({
    render_modes = { "n", "c", "t" }
})

EOF

