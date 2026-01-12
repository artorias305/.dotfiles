set nocompatible
filetype plugin on
syntax on

let mapleader = " "

set relativenumber

set tabstop=8
set shiftwidth=8
set hlsearch
colorscheme zaibatsu
set colorcolumn=80

nnoremap <leader>e <CMD>Explore<CR>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'vimwiki/vimwiki'
call plug#end()
