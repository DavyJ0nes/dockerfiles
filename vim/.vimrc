" Davy Jones vimrc
runtime! debian.vim
autocmd VimEnter * NERDTree
filetype off
set nocompatible           " make vim act like vim, not vi
call pathogen#infect()     " use pathogen package manager
call pathogen#helptags()
set t_Co=256
syntax enable
filetype plugin indent on
set background=dark
colorscheme tender
set colorcolumn=+1
hi ColorColumn ctermbg=yellow 
let mapleader=","   " change leader key to comma
set number          " enable line numbers
set relativenumber  " use relative line numbers
set showcmd         " show command at bottom of screen
set cursorline      " underline current line
set wildmenu        " helpful command completion with <TAB>
set showmatch       " show matching brackets etc
set ignorecase		  " Do case insensitive matching
let g:ctrlp_map = '<c-p>'  " map CTRL+P to ctrlP for fuzzy searching
let g:ctrlp_cmd = 'CtrlP'  " map CTRL+P to ctrlP for fuzzy searching
map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr> 
map <leader>son :setlocal spell spelllang=en_gb<cr>
map <leader>soff :set nospell<cr>
map gf <c-w>gf
map <leader>nt :tabnew<cr>
:nnoremap å <C-a>
:nnoremap ≈ <C-x>
:command WQ wq
:command Wq wq
:command W w
:command Q q
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
map <leader>q :q<cr>
noremap Z <Esc>:w<CR>
noremap ZZ <Esc>:wq<CR>
au FileType go nmap <Leader>gd <Plug>(go-doc-tab)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gi <Plug>(go-imports)
:command Date pu=strftime('%d-%m-%Y %H:%M')
:command DDiff w !diff % -
:cmap w!! w !sudo tee > /dev/null   
set tabstop=2     " tab == 2 spaces
set softtabstop=2
set shiftwidth=2
set expandtab     " tabs are spaces
set incsearch     " highlight when searching
set hlsearch      " highlight all matches on search
nmap <leader>h :nohlsearch<cr>
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
set noshowmode            " don't show insert at bottom
set ttyfast               " improves smoothness
set laststatus=2          " allow another status line so that airline will work
set wrap linebreak nolist " wrap on words so their not broken
set ttimeoutlen=0          " Improve mode shifting speed
let g:NERDTreeWinSize=18 
let g:NERDSpaceDelims = 1       " Add 1 space after comment delimiter
let g:NERDCompactSexyComs = 1   " Use compact style for multi lines
let g:NERDDefaultAlign = 'left' " Don't follow TABS when commenting
