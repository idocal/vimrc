set noerrorbells
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set backspace=indent,eol,start
set colorcolumn=80

highlight ColorColumn ctermbg=0 guibg=lightgrey

" Appearance:
colorscheme gruvbox
set background=dark
set guifont=Fira\ Mono:h14

" remove netrw message
let g:netrw_banner = 0

" Space-bar enters 'my command mode'
let mapleader = " "
"
" Move between windows using hjkl
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" easy close file
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" easy copy to clipboard:
vnoremap <leader>y "+y<CR>
nnoremap <leader>Y "+Y<CR>

" change cursor to line in insert mode:
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" undo tree:
nnoremap <leader>ut :UndotreeToggle<CR>

" Maximize pane on m
nnoremap <leader>m :MaximizerToggle<CR>

" Debugger remaps
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
