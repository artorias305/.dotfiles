" Basic settings
set nocompatible
syntax on
set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hidden

" Better completion sources
set complete=.,w,b,u,t,i

" Don't show automatic popup menu
set completeopt=menu,menuone,noinsert,noselect

" Trigger completion only with Tab
inoremap <Tab> <C-x><C-o>
inoremap <S-Tab> <C-p>

" Use dictionary fallback if omni completion not available
autocmd FileType text setlocal omnifunc=complete#omnifunc
