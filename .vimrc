set nocompatible
filetype off
filetype indent on

set autoindent
set number
set relativenumber

set tabstop=8
set shiftwidth=8

set hlsearch

set t_Co=256

set wildmenu

set colorcolumn=80
syntax on

let mapleader = " "

nnoremap <leader>e <CMD>Explore<CR>

call plug#begin()
Plug 'junegunn/vim-easy-align'
call plug#end()

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
