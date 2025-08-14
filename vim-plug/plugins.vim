" Plugins:
call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'neovim/nvim-lspconfig'

" --- Completion (cmp) ---
Plug 'hrsh7th/nvim-cmp'                  " core
Plug 'hrsh7th/cmp-nvim-lsp'              " LSP source
Plug 'hrsh7th/cmp-buffer'                " buffer words
Plug 'hrsh7th/cmp-path'                  " filesystem paths
Plug 'hrsh7th/cmp-cmdline'               " : and / completion (optional)
" Snippets (optional but recommended)
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
" Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'jiangmiao/auto-pairs'

call plug#end()
